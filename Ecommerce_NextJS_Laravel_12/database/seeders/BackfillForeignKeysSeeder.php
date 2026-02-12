<?php

namespace Database\Seeders;

use App\Models\BangladeshiArea;
use App\Models\CustomerAddress;
use App\Models\DeliveryZone;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderShipping;
use App\Models\Payment;
use App\Models\CouponUsage;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class BackfillForeignKeysSeeder extends Seeder
{
    public function run(): void
    {
        $this->backfillCustomerAddresses();
        $this->backfillOrders();
        $this->backfillOrderItems();
    }

    private function backfillCustomerAddresses(): void
    {
        CustomerAddress::whereNull('bangladeshi_area_id')
            ->whereNotNull('area')
            ->chunkById(200, function ($addresses) {
                foreach ($addresses as $address) {
                    $areaName = trim((string) $address->area);
                    if ($areaName === '') {
                        continue;
                    }

                    $area = BangladeshiArea::whereRaw('LOWER(name) = ?', [Str::lower($areaName)])
                        ->orWhereRaw('LOWER(thana_name) = ?', [Str::lower($areaName)])
                        ->first();

                    if ($area) {
                        $address->bangladeshi_area_id = $area->id;
                        $address->save();
                    }
                }
            });
    }

    private function backfillOrders(): void
    {
        Order::chunkById(200, function ($orders) {
            foreach ($orders as $order) {
                $dirty = false;

                if (!$order->delivery_zone_id) {
                    $zone = DeliveryZone::findForLocation($order->district, $order->area);
                    if ($zone) {
                        $order->delivery_zone_id = $zone->id;
                        $dirty = true;
                    }
                }

                if (!$order->payment_id) {
                    $payment = Payment::where('order_id', $order->id)->latest('id')->first();
                    if ($payment) {
                        $order->payment_id = $payment->id;
                        $dirty = true;
                    }
                }

                if (!$order->order_shipping_id) {
                    $orderShipping = OrderShipping::where('order_id', $order->id)->latest('id')->first();
                    if ($orderShipping) {
                        $order->order_shipping_id = $orderShipping->id;
                        $dirty = true;
                    }
                }

                if (!$order->shipping_method_id && $order->order_shipping_id) {
                    $orderShipping = OrderShipping::find($order->order_shipping_id);
                    if ($orderShipping && $orderShipping->shipping_method_id) {
                        $order->shipping_method_id = $orderShipping->shipping_method_id;
                        $dirty = true;
                    }
                }

                if ((!$order->billing_address_id || !$order->shipping_address_id) && $order->user_id) {
                    $defaultAddress = CustomerAddress::where('user_id', $order->user_id)
                        ->where('is_default', true)
                        ->first();
                    $fallbackAddress = $defaultAddress ?: CustomerAddress::where('user_id', $order->user_id)->first();

                    if ($fallbackAddress) {
                        if (!$order->billing_address_id) {
                            $order->billing_address_id = $fallbackAddress->id;
                            $dirty = true;
                        }
                        if (!$order->shipping_address_id) {
                            $order->shipping_address_id = $fallbackAddress->id;
                            $dirty = true;
                        }
                    }
                }

                if (!$order->coupon_id) {
                    $usage = CouponUsage::where('order_id', $order->id)->latest('id')->first();
                    if ($usage) {
                        $order->coupon_id = $usage->coupon_id;
                        $dirty = true;
                    }
                }

                if ($dirty) {
                    $order->save();
                }
            }
        });
    }

    private function backfillOrderItems(): void
    {
        OrderItem::whereNull('category_id')
            ->chunkById(200, function ($items) {
                foreach ($items as $item) {
                    if ($item->product_id) {
                        $categoryId = DB::table('products')->where('id', $item->product_id)->value('category_id');
                        if ($categoryId) {
                            $item->category_id = $categoryId;
                            $item->save();
                        }
                    }
                }
            });
    }
}
