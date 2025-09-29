<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Country;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $countries = [
            ['name' => 'Nigeria', 'iso_code' => 'NGA'],
            ['name' => 'Ghana', 'iso_code' => 'GHA'],
            ['name' => 'Kenya', 'iso_code' => 'KEN'],
        ];

        foreach ($countries as $country) {
            Country::updateOrCreate(['iso_code' => $country['iso_code']], $country);
        }
    }
}
