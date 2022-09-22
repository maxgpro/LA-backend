<?php

namespace App\Modules\Admin\TaskComments\Controllers\Api;

use App\Modules\Admin\TaskComments\Models\TaskComment;
use App\Modules\Admin\TaskComments\Requests\TaskCommentsRequest;
use App\Modules\Admin\TaskComments\Services\TaskCommentService;
use App\Services\Response\ResponseService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class TaskCommentController extends Controller
{

    private  $service;

    /**
     * LeadController constructor.
     * @param $service
     */
    public function __construct(TaskCommentService $service)
    {
        $this->service = $service;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(TaskCommentsRequest $request)
    {
        $this->authorize('edit', TaskComment::class);
        $task = $this->service->store($request, Auth::user());
        return ResponseService::sendJsonResponse(true, 200, [],[
            'item' => $task->renderData()
        ]);
    }
}
