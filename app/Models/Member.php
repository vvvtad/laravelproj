<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

class Member extends Model
{
    use HasFactory;

    protected $fillable = [
        'membership_number',
        'first_name',
        'last_name',
        'email',
        'phone',
        'address',
        'membership_category_id',
        'membership_level_id',
        'starts_at',
        'expires_at',
        'status',
        'notes',
    ];

    protected $casts = [
        'starts_at' => 'date',
        'expires_at' => 'date',
    ];

    protected static function booted(): void
    {
        static::creating(function (self $member) {
            $member->membership_number ??= self::generateMembershipNumber();
        });
    }

    public static function generateMembershipNumber(): string
    {
        do {
            $membershipNumber = 'MEM-'.date('Ym').'-'.strtoupper(Str::random(6));
        } while (self::where('membership_number', $membershipNumber)->exists());

        return $membershipNumber;
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(MembershipCategory::class, 'membership_category_id');
    }

    public function level(): BelongsTo
    {
        return $this->belongsTo(MembershipLevel::class, 'membership_level_id');
    }

    public function transactions(): HasMany
    {
        return $this->hasMany(MembershipTransaction::class);
    }

    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class);
    }
}
