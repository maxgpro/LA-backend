<?php

namespace App\Modules\Admin\Task\Policies;

use App\Modules\Admin\User\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class TaskPolicy
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
    public function view(User $user) {
        return $user->canDo(['SUPER_ADMINISTRATOR','TASK_ACCESS']);
    }

    public function create(User $user) {
        return $user->canDo(['SUPER_ADMINISTRATOR','TASK_CREATE']);
    }

    public function edit(User $user) {
        return $user->canDo(['SUPER_ADMINISTRATOR','TASK_EDIT']);
    }

    public function delete(User $user) {
        return $user->canDo(['SUPER_ADMINISTRATOR','TASK_EDIT']);
    }
}
