<?php


namespace App\Services\Date\Facades;


use Illuminate\Support\Facades\Facade;

class DateService extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'dateCheck';
    }
}
