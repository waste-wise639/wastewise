<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    
    protected $fillable = ['user_id', 'name', 'phone', 'phone_verified', 'avatar'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
