<?php

namespace App\Notifications;

use App\Modules\Warehouse\Models\Manually;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Auth;

class ApprovalManually extends Notification
{
    use Queueable;

    protected $manually;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Manually $manually)
    {
        $this->manually = $manually;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    public function toDatabase($notifiable)
    {
        return [
            'manually_id' => $this->manually->id,
            'user_name' => Auth::user()->name,
            'user_id' => Auth::id(),
            'status' =>$this->manually->status
        ];
    }
}
