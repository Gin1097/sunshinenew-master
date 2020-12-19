<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Khachhang;
use Session;
use Validator;
use Storage;
use DB;
use App\Http\Requests\KhachHangCreateRequest;

class KhachHangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $danhsachkhachhang = Khachhang::all();

        return view('backend.khachhang.index')
                ->with('danhsachkhachhang', $danhsachkhachhang);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('backend.khachhang.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // //
        // $validator = Validator::make($request->all(), [
        //     'kh_taiKhoan' => 'required|min:3|max:50', //tên table
        //     'kh_matKhau' => 'required|min:6|max:10',
        //     'kh_hoTen' => 'required|min:3|max:10',
        //     'kh_email' => 'required|min:8|max:100',
        //     'kh_ngaySinh' => 'required|min:8|max:10',
        //     'kh_diaChi' => 'required|min:10|max:100',
        //     'kh_dienThoai' => 'required|min:10|max:11'
        // ]);

        // // // Nếu kiểm tra ràng buộc dữ liệu thất bại -> tức là dữ liệu không hợp lệ
        // // // Chuyển hướng về view "Thêm mới" với,
        // // // - Thông báo lỗi vi phạm các quy luật.
        // // // - Dữ liệu cũ (người dùng đã nhập).
        // if ($validator->fails()) {
        //     return redirect(route('backend.khachhang.create'))
        //                 ->withErrors($validator)
        //                 ->withInput();
        // }
        // $kh = new Khachhang();

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $kh = Khachhang::find($id);
        return view('backend.khachhang.edit')
                ->with('kh', $kh);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        DB::table('khachhang')->where('kh_ma', $id)
        ->update([
            'kh_taiKhoan'=>$request->kh_taiKhoan,
            'kh_matKhau'=>bcrypt('123456'),
            'kh_hoTen'=>$request->kh_hoTen,
            'kh_gioiTinh'=>$request->kh_gioiTinh,
            'kh_email'=>$request->kh_email,
            'kh_ngaySinh'=>$request->kh_ngaySinh,
            'kh_diaChi'=>$request->kh_diaChi,
            'kh_dienThoai'=>$request->kh_dienThoai,
            'kh_trangThai'=>$request->kh_trangThai
        ]);
        Session::flash('alert-warning', 'Cập nhật thành công ^^~!!!');
        return redirect()->route('backend.khachhang.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $khachhang = Khachhang::find($id);
        $khachhang->kh_trangThai = 1;
        $khachhang->save();

        Session::flash('alert-warning', 'Xóa thành công ^^~!!!');
        return redirect()->route('backend.khachhang.index');
    }

    public function repose($id)
    {
        //
        $khachhang = Khachhang::find($id);
        $khachhang->kh_trangThai = 2;
        $khachhang->save();

        Session::flash('alert-info', 'Đặt lại thành công ^^~!!!');
        return redirect()->route('backend.khachhang.index');
    }
}
