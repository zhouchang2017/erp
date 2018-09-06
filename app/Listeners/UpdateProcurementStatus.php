<?php

namespace App\Listeners;

use App\Events\UpdateProcurementPlanProductVariant;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class UpdateProcurementStatus
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param UpdateProcurementPlanProductVariant $event
     * @return void
     */
    public function handle(UpdateProcurementPlanProductVariant $event)
    {
        $procurement = $event->productVariant->plan->procurement;
        $procurement->procurement_status = $event->productVariant->plan->calcShipmentStatus();
        $procurement->save();
    }
}
