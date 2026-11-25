<?php

namespace App\Notifications;

use App\Models\MembershipApplication;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class MembershipApplicationSubmitted extends Notification implements ShouldQueue
{
    use Queueable;

    public function __construct(public MembershipApplication $application)
    {
        $this->afterCommit();
    }

    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('Membership application received')
            ->greeting('Hello '.$this->application->full_name.',')
            ->line('We received your membership application.')
            ->line('Reference number: '.$this->application->reference_no)
            ->line('Status: Pending administrator review')
            ->line('You can sign in with the password you created after an administrator approves your application.')
            ->line('Keep this reference number for your records.')
            ->salutation(config('app.name'));
    }
}
