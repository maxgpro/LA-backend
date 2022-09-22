<?php

Route::group(['prefix' => 'units', 'middleware' => []], function () {
    Route::get('/', 'Api\UnitController@index')->name('api.units.index');
//    Route::post('/', 'Api\UnitController@store')->name('api.units.store');
//    Route::get('/{unit}', 'Api\UnitController@show')->name('api.units.read');
//    Route::put('/{unit}', 'Api\UnitController@update')->name('api.units.update');
//    Route::delete('/{unit}', 'Api\UnitController@destroy')->name('api.units.delete');
});
