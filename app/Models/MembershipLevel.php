<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MembershipLevel extends Model
{
    use HasFactory;

    protected $fillable = [
        'membership_category_id',
        'name',
        'fee',
        'validity_days',
        'benefits',
        'is_active',
    ];

    protected $casts = [
        'fee' => 'decimal:2',
        'validity_days' => 'integer',
        'is_active' => 'boolean',
    ];

    public function category(): BelongsTo
    {
        return $this->belongsTo(MembershipCategory::class, 'membership_category_id');
    }

    public function members(): HasMany
    {
        return $this->hasMany(Member::class);
    }
}
