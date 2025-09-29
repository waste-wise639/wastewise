<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\State;
use App\Models\Country;

class StateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

         $nigeria = Country::where('iso_code', 'NGA')->first();

        $states = [
            'Lagos',
            'Rivers',
            'Abuja (FCT)',
            'Kano',
            'Enugu',
            'Oyo',
            'Kaduna',
            'Delta',
        ];

        foreach ($states as $state) {
            State::updateOrCreate(
                ['name' => $state, 'country_id' => $nigeria->id],
                ['country_id' => $nigeria->id]
            );
        }
        
    }
}
