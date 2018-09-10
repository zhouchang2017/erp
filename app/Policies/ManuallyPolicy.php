<?php

namespace App\Policies;

use App\Modules\Procurement\Enums\ManuallyStatus;
use App\Modules\Warehouse\Models\Manually;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ManuallyPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function create()
    {
        return false;
    }

    public function update(User $user, Manually $manually)
    {
        return $manually->status !== ManuallyStatus::getDescription(3);
    }

    public function view()
    {
        return true;
    }
}
