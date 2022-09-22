<?php


namespace App\Modules\Admin\Unit\Services;


use App\Modules\Admin\Unit\Models\Unit;

class UnitService
{
    public function getUnits()
    {
        return Unit::all();
    }
}
