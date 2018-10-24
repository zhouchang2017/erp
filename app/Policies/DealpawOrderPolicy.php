<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class DealpawOrderPolicy
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

    public function view()
    {
        return true;
    }

    public function create()
    {
        return false;
    }

    public function update()
    {
        return false;
    }

    public function delete()
    {
        return false;
    }
}
