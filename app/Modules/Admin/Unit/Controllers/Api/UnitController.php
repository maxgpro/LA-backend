<?php

namespace App\Modules\Admin\Unit\Controllers\Api;

use App\Modules\Admin\Unit\Models\Unit;
use App\Modules\Admin\Unit\Services\UnitService;
use App\Services\Response\ResponseService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UnitController extends Controller
{
    private $service;

    public function __construct(UnitService $unitService)
    {
        $this->service = $unitService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return ResponseService::sendJsonResponse(true, 200,[],[
            'items' =>  $this->service->getUnits()
        ]);
    }
}
