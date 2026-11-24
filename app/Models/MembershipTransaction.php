<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

class MembershipTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'member_id',
        'transaction_code',
        'type',
        'amount',
        'status',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
    ];

    protected static function booted(): void
    {
        static::creating(function (self $transaction) {
            $transaction->transaction_code ??= self::generateTransactionCode();
        });
    }

    public static function generateTransactionCode(): string
    {
        do {
            $code = 'TXN-'.date('Ymd').'-'.strtoupper(Str::random(8));
        } while (self::where('transaction_code', $code)->exists());

        return $code;
    }

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
    }

    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class);
    }
}
