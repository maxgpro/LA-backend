<?php

Route::group(['prefix' => 'sources', 'middleware' => []], function () {
    Route::get('/', 'Api\SourceController@index')->name('api.sources.index');
    Route::post('/', 'Api\SourceController@store')->name('api.sources.store');
    Route::get('/{source}', 'Api\SourceController@show')->name('api.sources.read');
    Route::put('/{source}', 'Api\SourceController@update')->name('api.sources.update');
    Route::delete('/{source}', 'Api\SourceController@destroy')->name('api.sources.delete');
});