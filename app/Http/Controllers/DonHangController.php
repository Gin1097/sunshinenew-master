<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Donhang;
use App\Khachhang;
use App\Nhanvien;
use App\Vanchuyen;
use Carbon\Carbon;
use App\Thanhtoan;
use Session;
use Storage;
use DB;
use Barryvdh\DomPDF\Facade as PDF;

class DonHangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $danhsachdonhang = Donhang::paginate(5);

        return view('backend.donhang.index')
            ->with('danhsachdonhang', $danhsachdonhang);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
        $dh = Donhang::where("dh_ma", $id)->first();
        $ds_khachhang = DB::table('khachhang')
        ->select('kh_ma', 'kh_hoTen', 'kh_trangThai')
        ->where('kh_trangThai', 2)
        ->get();
        $ds_vanchuyen = DB::table('vanchuyen')
        ->select('vc_ma', 'vc_ten', 'vc_trangThai')
        ->where('vc_trangThai', 2)
        ->get();
        $ds_thanhtoan = DB::table('thanhtoan')
        ->select('tt_ma', 'tt_ten', 'tt_trangThai')
        ->where('tt_trangThai', 2)
        ->get();

        return view('backend.donhang.edit')
            ->with('dh', $dh)
            ->with('danhsachvanchuyen', $ds_vanchuyen)
            ->with('danhsachthanhtoan', $ds_thanhtoan)
            ->with('danhsachkhachhang', $ds_khachhang);
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
        $donhang = Donhang::find($id);
        $donhang->kh_ma = $request->kh_ma;
        $donhang->dh_nguoiNhan = $request->dh_nguoiNhan;
        $donhang->dh_diaChi = $request->dh_diaChi;
        $donhang->dh_dienThoai = $request->dh_dienThoai;
        $donhang->dh_nguoiGui = $request->dh_nguoiGui;
        $donhang->dh_loiChuc = $request->dh_loiChuc;
        $donhang->vc_ma = $request->vc_ma;
        $donhang->tt_ma = $request->tt_ma;
        $donhang->save();

        Session::flash('alert-warning', 'Cập nhật thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }


    public function xuly($id)
    {
        //
        $dh = Donhang::where("dh_ma", $id)->first();
        $ds_nhanvien = Nhanvien::where('q_ma', 6)->get();
        
        return view('backend.donhang.xuly')
            ->with('dh', $dh)
            ->with('ds_nhanvien', $ds_nhanvien);
    }
    public function xulyupdate(Request $request, $id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->nv_xuLy = $request->nv_xuLy;
        $donhang->dh_ngayXuLy = Carbon::now();
        $donhang->nv_giaoHang = $request->nv_giaoHang;
        $donhang->dh_trangThai = 2;
        $donhang->save();

        Session::flash('alert-info', 'Xử lý thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }

    public function giao($id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->dh_ngayLapPhieuGiao = Carbon::now();
        $donhang->dh_trangThai = 3;
        $donhang->save();

        Session::flash('alert-success', 'Xử lý thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }

    public function dagiao($id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->dh_ngayGiaoHang = Carbon::now('Asia/Ho_Chi_Minh');
        $donhang->dh_trangThai = 4;
        $donhang->dh_daThanhToan = 1;
        $donhang->save();

        Session::flash('alert-success', 'Giao hàng thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }


    public function doi($id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->dh_trangThai = 5;
        $donhang->save();

        Session::flash('alert-warning', 'Đổi thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }

    public function doi1($id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->dh_trangThai = 3;
        $donhang->save();

        Session::flash('alert-warning', 'Đổi thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }

    public function tra($id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->dh_trangThai = 7;
        $donhang->save();

        Session::flash('alert-warning', 'Trả thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }


    public function huy($id)
    {
        //
        $donhang = Donhang::find($id);
        $donhang->dh_trangThai = 6;
        $donhang->save();

        Session::flash('alert-danger', 'Hủy hàng thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
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
        $donhang = Donhang::find($id);
        $donhang->delete();

        Session::flash('alert-danger', 'Xóa thành công ^^~!!!');
        return redirect()->route('backend.donhang.index');
    }
}
