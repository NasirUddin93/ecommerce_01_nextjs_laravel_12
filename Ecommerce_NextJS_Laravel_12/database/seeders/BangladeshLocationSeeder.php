<?php

namespace Database\Seeders;

use App\Models\BangladeshiDivision;
use App\Models\BangladeshiDistrict;
use App\Models\BangladeshiArea;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class BangladeshLocationSeeder extends Seeder
{
    public function run(): void
    {
        $divisions = [
            'Dhaka' => ['code' => 'DHA', 'districts' => [
                'Dhaka', 'Gazipur', 'Narayanganj', 'Narsingdi', 'Munshiganj', 'Manikganj',
                'Tangail', 'Kishoreganj', 'Faridpur', 'Gopalganj', 'Madaripur', 'Rajbari', 'Shariatpur',
            ]],
            'Chattogram' => ['code' => 'CHT', 'districts' => [
                'Chattogram', "Cox's Bazar", 'Cumilla', 'Brahmanbaria', 'Chandpur',
                'Feni', 'Lakshmipur', 'Noakhali', 'Khagrachhari', 'Rangamati', 'Bandarban',
            ]],
            'Rajshahi' => ['code' => 'RAJ', 'districts' => [
                'Rajshahi', 'Bogura', 'Pabna', 'Sirajganj', 'Naogaon', 'Natore', 'Chapainawabganj', 'Joypurhat',
            ]],
            'Khulna' => ['code' => 'KHU', 'districts' => [
                'Khulna', 'Jashore', 'Satkhira', 'Bagerhat', 'Narail', 'Jhenaidah', 'Kushtia',
                'Magura', 'Chuadanga', 'Meherpur',
            ]],
            'Barishal' => ['code' => 'BAR', 'districts' => [
                'Barishal', 'Bhola', 'Patuakhali', 'Pirojpur', 'Barguna', 'Jhalokati',
            ]],
            'Sylhet' => ['code' => 'SYL', 'districts' => [
                'Sylhet', 'Moulvibazar', 'Habiganj', 'Sunamganj',
            ]],
            'Rangpur' => ['code' => 'RAN', 'districts' => [
                'Rangpur', 'Dinajpur', 'Kurigram', 'Lalmonirhat', 'Nilphamari', 'Panchagarh',
                'Thakurgaon', 'Gaibandha',
            ]],
            'Mymensingh' => ['code' => 'MYM', 'districts' => [
                'Mymensingh', 'Jamalpur', 'Sherpur', 'Netrokona',
            ]],
        ];

        foreach ($divisions as $divisionName => $divisionData) {
            $division = BangladeshiDivision::firstOrCreate(
                ['name' => $divisionName],
                ['code' => $divisionData['code'], 'is_active' => true]
            );

            foreach ($divisionData['districts'] as $districtName) {
                $baseCode = Str::upper(Str::slug($districtName, ''));
                if (strlen($baseCode) > 10) {
                    $hash = strtoupper(dechex(crc32($districtName)));
                    $baseCode = substr($baseCode, 0, 8) . substr($hash, 0, 2);
                }
                $districtCode = substr($baseCode, 0, 10);
                $district = BangladeshiDistrict::firstOrCreate(
                    ['division_id' => $division->id, 'code' => $districtCode],
                    ['name' => $districtName, 'is_active' => true]
                );

                $areaCode = $districtCode . '-SAD';
                BangladeshiArea::firstOrCreate(
                    ['district_id' => $district->id, 'code' => $areaCode],
                    ['name' => 'Sadar', 'thana_name' => 'Sadar', 'is_active' => true]
                );

                // Add specific areas for Dhaka district
                if ($districtName === 'Dhaka') {
                    $dhakaAreas = [
                        ['name' => 'Uttara', 'thana' => 'Uttara', 'postal' => '1230'],
                        ['name' => 'Mirpur', 'thana' => 'Mirpur', 'postal' => '1216'],
                        ['name' => 'Mohammadpur', 'thana' => 'Mohammadpur', 'postal' => '1207'],
                        ['name' => 'Dhanmondi', 'thana' => 'Dhanmondi', 'postal' => '1209'],
                        ['name' => 'Gulshan', 'thana' => 'Gulshan', 'postal' => '1212'],
                        ['name' => 'Banani', 'thana' => 'Banani', 'postal' => '1213'],
                        ['name' => 'Motijheel', 'thana' => 'Motijheel', 'postal' => '1000'],
                        ['name' => 'Shahbag', 'thana' => 'Shahbag', 'postal' => '1000'],
                        ['name' => 'Tejgaon', 'thana' => 'Tejgaon', 'postal' => '1215'],
                        ['name' => 'Badda', 'thana' => 'Badda', 'postal' => '1212'],
                        ['name' => 'Rampura', 'thana' => 'Rampura', 'postal' => '1219'],
                        ['name' => 'Banasree', 'thana' => 'Banasree', 'postal' => '1219'],
                        ['name' => 'Bashundhara', 'thana' => 'Bashundhara', 'postal' => '1229'],
                        ['name' => 'Baridhara', 'thana' => 'Baridhara', 'postal' => '1212'],
                        ['name' => 'Khilkhet', 'thana' => 'Khilkhet', 'postal' => '1229'],
                        ['name' => 'Mohakhali', 'thana' => 'Mohakhali', 'postal' => '1212'],
                        ['name' => 'Pallabi', 'thana' => 'Pallabi', 'postal' => '1216'],
                        ['name' => 'Kafrul', 'thana' => 'Kafrul', 'postal' => '1206'],
                        ['name' => 'Cantonment', 'thana' => 'Cantonment', 'postal' => '1206'],
                        ['name' => 'Old Dhaka', 'thana' => 'Old Dhaka', 'postal' => '1100'],
                    ];

                    foreach ($dhakaAreas as $area) {
                        $areaCodeUnique = $districtCode . '-' . strtoupper(substr($area['name'], 0, 3)) . '-' . $area['postal'];
                        BangladeshiArea::firstOrCreate(
                            ['district_id' => $district->id, 'code' => $areaCodeUnique],
                            [
                                'name' => $area['name'],
                                'thana_name' => $area['thana'],
                                'is_active' => true,
                                'delivery_charge_base' => 60.00
                            ]
                        );
                    }
                }
            }
        }
    }
}
