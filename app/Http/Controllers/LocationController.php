<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Country;
use App\Models\State;
use App\Models\City;

class LocationController extends Controller
{
    
    // Get all countries
    public function countries()
    {
        $countries = Country::select('id', 'name', 'iso_code')->get();

        return response()->json($countries);
    }

    // Get states by country
    public function states(Country $country)
    {
        return response()->json(
            $country->states()->select('id', 'name')->get()
        );
    }

    // Get cities by state
    public function cities(State $state)
    {
        return response()->json(
            $state->cities()->select('id', 'name')->get()
        );
    }

}
