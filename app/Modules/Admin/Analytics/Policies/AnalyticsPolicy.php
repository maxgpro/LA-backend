<?php

namespace App\Modules\Admin\Analytics\Policies;

use App\Modules\Admin\User\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

trait AnalyticsPolicy
{
    public function viewAnalytics(User $user) {
        return $user->canDo(['SUPER_ADMINISTRATOR','ANALYTICS_ACCESS']);
    }
}
