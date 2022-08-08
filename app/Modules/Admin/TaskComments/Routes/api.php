<?php

Route::group(['prefix' => 'task-comments', 'middleware' => []], function () {
    Route::post('/', 'Api\TaskCommentController@store')->name('api.task-comments.store');

});
