<?php

namespace App\Modules\Admin\Lead\Request;

use App\Services\Requests\ApiRequest;
use Illuminate\Support\Facades\Auth;

class LeadCreateRequest extends ApiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->canDo(['SUPER_ADMINISTRATOR','LEAD_ACCESS']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'link' => 'required_without:phone',
            'phone' => 'required_without:link',
            'source_id' => 'required',
            'unit_id' => 'required',
            'is_processed' => 'required',
        ];
    }
}
