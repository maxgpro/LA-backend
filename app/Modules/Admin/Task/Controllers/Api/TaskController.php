<?php

namespace App\Modules\Admin\Task\Controllers\Api;

use App\Modules\Admin\Task\Models\Task;
use App\Modules\Admin\Task\Services\TaskService;
use App\Services\Response\ResponseService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
    private  $service;

    /**
     * LeadController constructor.
     * @param $service
     */
    public function __construct(TaskService $service)
    {
        $this->service = $service;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $this->authorize('view', Task::class);
        $result = $this->service->getTasks();
        return ResponseService::sendJsonResponse(true, 200, [],[
            'items' => $result
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $this->authorize('create', Task::class);
        return ResponseService::sendJsonResponse(true, 200, [],[
            'item' => $this->service->store($request, Auth::user())
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Modules\Admin\Task\Models\Task  $task
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Task $task)
    {
        $this->authorize('view', Task::class);
        return ResponseService::sendJsonResponse(true, 200, [],[
            'item' => $task
        ]);
    }

    public function archive()
    {
        $this->authorize('view', Task::class);
        $tasks = $this->service->archive();
        return ResponseService::sendJsonResponse(true, 200, [],[
            'items' => $tasks
        ]);
    }
}
