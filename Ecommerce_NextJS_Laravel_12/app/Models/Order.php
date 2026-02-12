<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'customer_name',
        'customer_email',
        'customer_phone',
        'shipping_address',
        'city',
        'district',
        'area',
        'postal_code',
        'state',
        'country',
        'delivery_zone_id',
        'total_amount',
        'discount_amount',
        'coupon_id',
        'shipping_fee',
        'final_amount',
        'payment_id',
        'status',
        'payment_method',
        'customer_notes',
        'tracking_number',
        'shipping_method_id',
        'order_shipping_id',
        'billing_address',
        'billing_city',
        'billing_district',
        'billing_area',
        'billing_postal_code',
        'billing_state',
        'billing_country',
        'billing_address_id',
        'shipping_address_id',
    ];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function payment()
    {
        return $this->hasOne(Payment::class);
    }

    public function paymentLink()
    {
        return $this->belongsTo(Payment::class, 'payment_id');
    }

    public function shipping()
    {
        return $this->hasOne(OrderShipping::class);
    }

    public function orderShipping()
    {
        return $this->belongsTo(OrderShipping::class, 'order_shipping_id');
    }

    public function shippingMethod()
    {
        return $this->belongsTo(ShippingMethod::class, 'shipping_method_id');
    }

    public function deliveryZone()
    {
        return $this->belongsTo(DeliveryZone::class, 'delivery_zone_id');
    }

    public function billingAddress()
    {
        return $this->belongsTo(CustomerAddress::class, 'billing_address_id');
    }

    public function shippingAddress()
    {
        return $this->belongsTo(CustomerAddress::class, 'shipping_address_id');
    }

    public function coupon()
    {
        return $this->belongsTo(Coupon::class, 'coupon_id');
    }

    public function statusHistory()
    {
        return $this->hasMany(OrderStatusHistory::class)->orderBy('created_at', 'desc');
    }

    public function assignDeliveryZone(): void
    {
        if ($this->delivery_zone_id) {
            return;
        }

        $zone = DeliveryZone::findForLocation($this->district, $this->area);
        if ($zone) {
            $this->delivery_zone_id = $zone->id;
        }
    }
}
