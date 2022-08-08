<?php

namespace App\Modules\Admin\Task\Request;

use App\Services\Requests\ApiRequest;
use Illuminate\Support\Facades\Auth;

class TaskCreateRequest extends ApiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->canDo(['SUPER_ADMINISTRATOR','TASK_ACCESS']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'text'=>'string|required',
            'responsible_id'=>'required',
        ];
    }
}
