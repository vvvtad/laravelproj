<?php

namespace App\Notifications;

use App\Models\MembershipApplication;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class MembershipApplicationReviewed extends Notification implements ShouldQueue
{
    use Queueable;

    public function __construct(
        public MembershipApplication $application,
        public bool $approved,
        public bool $paymentRequired = false,
    ) {
        $this->afterCommit();
    }

    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    public function toMail(object $notifiable): MailMessage
    {
        $message = (new MailMessage)
            ->subject($this->approved ? 'Membership application approved' : 'Membership application update')
            ->greeting('Hello '.$this->application->full_name.',')
            ->line('Application reference: '.$this->application->reference_no);

        if (! $this->approved) {
            return $message
                ->line('Your membership application was not approved. Please contact the membership office if you need more information.')
                ->salutation(config('app.name'));
        }

        $message->line('Your membership application was approved. You can sign in with the password you created.');

        if ($this->paymentRequired) {
            $message->line('Your membership remains pending until payment is recorded and approved.');
        } else {
            $message->line('Your membership is active.');
        }

        return $message->salutation(config('app.name'));
    }
}
