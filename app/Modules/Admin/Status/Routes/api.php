<?php

Route::group(['prefix' => 'statuses', 'middleware' => ['auth:api']], function () {
    Route::get('/', 'Api\StatusController@index')->name('api.statuses.index');
});
