<?php

namespace Chang\AmazonMws\Jobs;

use Chang\AmazonMws\Models\Amazon;
use Chang\AmazonMws\Models\Order;
use Chang\AmazonMws\Services\AmazonService;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class SyncOrdersJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $amazon;

    public $timeout = 4800;

    public $tries = 1;
    /**
     * Create a new job instance.
     *
     * @param Amazon $amazon
     */
    public function __construct(Amazon $amazon)
    {
        $this->amazon = $amazon;
    }

    /**
     * Execute the job.
     *
     * @param AmazonService $service
     * @return void
     */
    public function handle(AmazonService $service)
    {
        $service->setAmazon($this->amazon);
        $service->syncOrders();
    }
}
