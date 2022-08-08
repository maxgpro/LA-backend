<?php

namespace App\Modules\Admin\TaskComments\Requests;

use App\Services\Requests\ApiRequest;
use Illuminate\Support\Facades\Auth;

class TaskCommentsRequest extends ApiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->canDo(['SUPER_ADMINISTRATOR','TASKS_COMMENT_CREATE']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'task_id' => 'required|integer',
            'status_id' => 'required|integer',
            'text' => 'string|nullable',
        ];
    }
}
