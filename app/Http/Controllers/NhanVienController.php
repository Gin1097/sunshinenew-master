<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Nhanvien;
use DB;
use App\Quyen;
use Session;
use Storage;
use Barryvdh\DomPDF\Facade as PDF;

class NhanVienController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        
        $ds_nhanvien = Nhanvien::paginate(5);
        return view('backend.nhanvien.index')
            ->with('danhsachnhanvien', $ds_nhanvien);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        // Sử dụng Eloquent Model để truy vấn dữ liệu
        $ds_quyen = DB::table('quyen')
        ->select('q_ma', 'q_ten', 'q_trangThai')
        ->where('q_trangThai', 2)
        ->get(); // SELECT * FROM loai

        // Đường dẫn đến view được quy định như sau: <FolderName>.<ViewName>
        // Mặc định đường dẫn gốc của method view() là thư mục `resources/views`
        // Hiển thị view `backend.sanpham.create`
        return view('backend.nhanvien.create')
            // với dữ liệu truyền từ Controller qua View, được đặt tên là `danhsachloai`
            ->with('danhsachquyen', $ds_quyen);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $nv = new Nhanvien();
        $nv->nv_taiKhoan = $request->nv_taiKhoan;
        $nv->nv_matKhau = bcrypt($request->nv_matKhau);
        $nv->nv_hoTen = $request->nv_hoTen;
        $nv->nv_gioiTinh = $request->nv_gioiTinh;
        $nv->nv_email = $request->nv_email;
        $nv->nv_ngaySinh = $request->nv_ngaySinh;
        $nv->nv_diaChi = $request->nv_diaChi;
        $nv->nv_dienThoai = $request->nv_dienThoai;
        $nv->nv_trangThai = $request->nv_trangThai;
        $nv->q_ma = $request->q_ma;

        $nv->save();

        Session::flash('alert-success', 'Thêm mới thành công ^^~!!!');
        return redirect()->route('backend.nhanvien.index');
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
        $nv = Nhanvien::where("nv_ma", $id)->first();
        $ds_quyen = DB::table('quyen')
        ->select('q_ma', 'q_ten', 'q_trangThai')
        ->where('q_trangThai', 2)
        ->get();

        return view('backend.nhanvien.edit')
            ->with('nv', $nv)
            ->with('danhsachquyen', $ds_quyen);
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
        $nv = Nhanvien::find($id);
        $nv->nv_taiKhoan = $request->nv_taiKhoan;
        $nv->nv_matKhau = bcrypt('123456');
        $nv->nv_hoTen = $request->nv_hoTen;
        $nv->nv_gioiTinh = $request->nv_gioiTinh;
        $nv->nv_email = $request->nv_email;
        $nv->nv_ngaySinh = $request->nv_ngaySinh;
        $nv->nv_diaChi = $request->nv_diaChi;
        $nv->nv_dienThoai = $request->nv_dienThoai;
        $nv->nv_trangThai = $request->nv_trangThai;
        $nv->q_ma = $request->q_ma;

        $nv->save();

        Session::flash('alert-warning', 'Cập nhật thành công ^^~!!!');
        return redirect()->route('backend.nhanvien.index');
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
        $nhanvien = Nhanvien::find($id);
        $nhanvien->nv_trangThai = 1;
        $nhanvien->save();

        Session::flash('alert-danger', 'Xóa thành công ^^~!!!');
        return redirect()->route('backend.nhanvien.index');
    }

    public function repose($id)
    {
        //
        $nhanvien = Nhanvien::find($id);
        $nhanvien->nv_trangThai = 2;
        $nhanvien->save();

        Session::flash('alert-info', 'Đặt lại thành công ^^~!!!');
        return redirect()->route('backend.nhanvien.index');
    }
}
