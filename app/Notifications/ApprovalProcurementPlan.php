<?php

namespace App\Notifications;

use App\Modules\Procurement\Models\ProcurementPlan;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Auth;

class ApprovalProcurementPlan extends Notification
{
    use Queueable;

    protected $plan;

    /**
     * Create a new notification instance.
     *
     * @param ProcurementPlan $plan
     */
    public function __construct(ProcurementPlan $plan)
    {
        $this->plan = $plan;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed $notifiable
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
            'procurement_Plan_id' => $this->plan->id,
            'user_name' => Auth::user()->name,
            'user_id' => Auth::id(),
            'status' =>$this->plan->status
        ];
    }
}
