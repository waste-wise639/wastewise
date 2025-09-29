<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\City;
use App\Models\State;

class CitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $lagos = State::where('name', 'Lagos')->first();
        $rivers = State::where('name', 'Rivers')->first();

        $cities = [
            $lagos->id => ['Ikeja', 'Victoria Island', 'Lekki', 'Epe'],
            $rivers->id => ['Port Harcourt', 'Bonny', 'Omoku', 'Degema'],
        ];

        foreach ($cities as $stateId => $cityNames) {
            foreach ($cityNames as $city) {
                City::updateOrCreate(
                    ['name' => $city, 'state_id' => $stateId],
                    ['state_id' => $stateId]
                );
            }
        }
    }
}
