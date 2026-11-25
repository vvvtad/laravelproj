<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class MembershipApplication extends Model
{
    use HasFactory;

    public const STATUS_PENDING = 'pending';

    public const STATUS_APPROVED = 'approved';

    public const STATUS_REJECTED = 'rejected';

    protected $fillable = [
        'membership_category_id',
        'reference_no',
        'full_name',
        'email',
        'phone',
        'address',
        'latitude',
        'longitude',
        'status',
        'verification_sent_at',
        'reviewed_at',
    ];

    protected $casts = [
        'latitude' => 'decimal:7',
        'longitude' => 'decimal:7',
        'verification_sent_at' => 'datetime',
        'reviewed_at' => 'datetime',
    ];

    public static function generateReferenceNumber(): string
    {
        do {
            $referenceNumber = 'MEM-'.Str::upper(Str::random(10));
        } while (self::where('reference_no', $referenceNumber)->exists());

        return $referenceNumber;
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(MembershipCategory::class, 'membership_category_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
