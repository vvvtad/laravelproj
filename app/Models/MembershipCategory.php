<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MembershipCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'slug',
        'description',
        'is_active',
    ];

    public function levels(): HasMany
    {
        return $this->hasMany(MembershipLevel::class);
    }

    public function members(): HasMany
    {
        return $this->hasMany(Member::class);
    }
}
