<?php

Route::group(['prefix' => 'tasks', 'middleware' => []], function () {
    Route::get('/', 'Api\TaskController@index')->name('api.tasks.index');
    Route::post('/', 'Api\TaskController@store')->name('api.tasks.store');
    Route::get('/{task}', 'Api\TaskController@show')->name('api.tasks.read');

    Route::get('/archive/index', 'Api\TaskController@archive')->name('api.tasks.archive');
});
