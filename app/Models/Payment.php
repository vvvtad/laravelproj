<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class Payment extends Model
{
    use HasFactory;

    protected $fillable = [
        'member_id',
        'membership_transaction_id',
        'amount',
        'payment_method',
        'reference_number',
        'status',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
    ];

    protected static function booted(): void
    {
        static::creating(function (self $payment) {
            $payment->reference_number ??= self::generateReferenceNumber();
        });
    }

    public static function generateReferenceNumber(): string
    {
        do {
            $reference = 'PAY-'.date('Ymd').'-'.strtoupper(Str::random(8));
        } while (self::where('reference_number', $reference)->exists());

        return $reference;
    }

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
    }

    public function transaction(): BelongsTo
    {
        return $this->belongsTo(MembershipTransaction::class, 'membership_transaction_id');
    }
}
