<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ChuyenKhoCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            
            'ck_lydo'=> 'required|min:3|max:50',
            'sp_ma' => 'required',
            'kho_ma' => 'required',
            'ck_soluong' => 'required|'
        ];

    }
    public function messages(){
        return [
        //Nhan vien
        //Ly do
        'ck_lydo.required' => "Vui lòng nhập lý do",
        'ck_lydo.min' => 'Lý do ít nhất 3 ký tự',
        'ck_lydo.max' => 'Lý do không được quá 50 ký tự',
        //san pham
        'sp_ma.required' => 'Chọn Chọn sản phẩm',
        //Kho
        'kho_ma.required' => 'Chọn kho cần chuyển tới',
        // Số lượng
        'ck_soluong.required' => 'Nhập số lượng',
        ];
    }
}
