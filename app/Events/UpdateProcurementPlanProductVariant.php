<?php

namespace App\Events;

use App\Modules\Procurement\Models\ProcurementPlanProductVariant;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class UpdateProcurementPlanProductVariant
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $productVariant;

    /**
     * Create a new event instance.
     *
     * @param ProcurementPlanProductVariant $productVariant
     */
    public function __construct(ProcurementPlanProductVariant $productVariant)
    {
        $this->productVariant = $productVariant;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
