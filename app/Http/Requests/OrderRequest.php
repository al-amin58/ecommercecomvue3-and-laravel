<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'user_id'=>'required',
            'address_id'=>'required',
            'order_id' => ' nullable',
            'delivery_charge'=>'nullable',
            'price'=> 'required',
            'order_date'=>'nullable',
            'payment_method'=>'nullable',
            'order_status'=>'nullable',
            'payment_status'=>'nullable',
            'isShow'=>'nullable',
            'status'=>'nullable',
            'transaction_id'=>'nullable',
            'currency'=>'nullable',
        ];
    }
}
