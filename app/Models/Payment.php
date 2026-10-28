<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
    }

    public function transaction(): BelongsTo
    {
        return $this->belongsTo(MembershipTransaction::class, 'membership_transaction_id');
    }
}
