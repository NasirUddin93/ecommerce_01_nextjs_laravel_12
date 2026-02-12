<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Setting;

class SettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $defaults = [
            [
                'key' => 'site_name',
                'value' => 'My E-commerce Store',
                'type' => 'string',
                'group' => 'general',
                'description' => 'Website name',
                'is_encrypted' => false
            ],
            [
                'key' => 'site_email',
                'value' => 'admin@example.com',
                'type' => 'string',
                'group' => 'general',
                'description' => 'Contact email',
                'is_encrypted' => false
            ],
            [
                'key' => 'currency',
                'value' => 'BDT',
                'type' => 'string',
                'group' => 'general',
                'description' => 'Store currency',
                'is_encrypted' => false
            ],
            [
                'key' => 'tax_rate',
                'value' => '0',
                'type' => 'integer',
                'group' => 'general',
                'description' => 'Tax percentage',
                'is_encrypted' => false
            ],
            [
                'key' => 'free_shipping_threshold',
                'value' => '1000',
                'type' => 'integer',
                'group' => 'shipping',
                'description' => 'Free shipping minimum amount',
                'is_encrypted' => false
            ],
            [
                'key' => 'smtp_host',
                'value' => 'smtp.gmail.com',
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP server host',
                'is_encrypted' => false
            ],
            [
                'key' => 'smtp_port',
                'value' => '587',
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP server port',
                'is_encrypted' => false
            ],
            [
                'key' => 'smtp_username',
                'value' => '',
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP username',
                'is_encrypted' => false
            ],
            [
                'key' => 'smtp_password',
                'value' => '',
                'type' => 'string',
                'group' => 'email',
                'description' => 'SMTP password',
                'is_encrypted' => true
            ],
            [
                'key' => 'payment_gateway',
                'value' => 'stripe',
                'type' => 'string',
                'group' => 'payment',
                'description' => 'Payment gateway provider',
                'is_encrypted' => false
            ],
            [
                'key' => 'payment_test_mode',
                'value' => 'true',
                'type' => 'boolean',
                'group' => 'payment',
                'description' => 'Payment test mode enabled',
                'is_encrypted' => false
            ],
            [
                'key' => 'logo_url',
                'value' => '',
                'type' => 'string',
                'group' => 'general',
                'description' => 'Store logo URL',
                'is_encrypted' => false
            ],
            [
                'key' => 'favicon_url',
                'value' => '',
                'type' => 'string',
                'group' => 'general',
                'description' => 'Favicon URL',
                'is_encrypted' => false
            ]
        ];

        foreach ($defaults as $setting) {
            Setting::firstOrCreate(
                ['key' => $setting['key']],
                [
                    'value' => $setting['value'],
                    'type' => $setting['type'],
                    'group' => $setting['group'],
                    'description' => $setting['description'],
                    'is_encrypted' => $setting['is_encrypted'],
                    'version' => 1
                ]
            );
        }

        $this->command->info('Settings seeded successfully!');
    }
}
