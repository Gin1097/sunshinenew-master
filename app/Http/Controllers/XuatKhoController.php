<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Xuatkho;
use App\Sanpham;
use App\Nhanvien;
use App\Donvitinh;
use App\Kho;
use App\Sanphamkho;
use App\ChitietXuatkho;
use DB;
use Session;
use Auth;
use Validator;
use App\Http\Requests\XuatKhoCreateRequest;

class XuatKhoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $danhsachxuatkho = Xuatkho::paginate(5);

        return view('backend.xuatkho.index')
                ->with('danhsachxuatkho', $danhsachxuatkho);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $ds_nhanvien = Nhanvien::select('nv_ma', 'nv_hoTen', 'nv_trangThai')
        ->where('nv_trangThai', 2)
        ->get();
        $ds_sp = Sanpham::select('sp_ma', 'sp_ten', 'sp_trangThai')
        ->where('sp_trangThai', 2)
        ->get();
        $ds_dvt = Donvitinh::select('dvt_ma', 'dvt_ten', 'dvt_trangThai')
        ->where('dvt_trangThai', 2)
        ->get();
        $ds_spk = Sanphamkho::all();
        $ds_kho = Kho::select('kho_ma', 'kho_ten', 'kho_trangThai')
        ->where('kho_trangThai', 2)
        ->get();
        return view('backend.xuatkho.create')
        // với dữ liệu truyền từ Controller qua View, được đặt tên là `danhsachloai`
        ->with('danhsachsanpham', $ds_sp)
        ->with('danhsachdonvitinh', $ds_dvt)
        ->with('danhsachsanphamkho', $ds_spk)
        ->with('danhsachkho', $ds_kho)
        ->with('danhsachnhanvien', $ds_nhanvien);
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
        $sl = $request->xk_soluong;
        $sln = $request->sl_nhap;
        $gb = $request->sp_giaBan;
        $slton = $request->sl_ton;
        if($slton>0){
            if($sl>0 && $sl<=$sln){
                $id = $request->kho_ma;
                $id1 = $request->sp_ma;
                
                DB::table('sanphamkho')->where('kho_ma', $id)
                ->where('sp_ma', $id1)
                ->update([
                    'kho_ma'=>$request->kho_ma,
                    'sp_ma'=>$request->sp_ma,
                    'sl_nhap'=>$request->sl_nhap,
                    'sl_ton'=>$request->sl_ton-$request->xk_soluong ,
                    'sl_xuat'=>$request->sl_xuat+$request->xk_soluong
                ]);

                $xk = new Xuatkho();
                $xk->xk_ngaylap = date('Y-m-d');
                $xk->xk_diachi = $request->xk_diachi;
                $xk->xk_lydo = $request->xk_lydo;
                $xk->xk_tongtien = $gb*$sl;
                $xk->nv_ma = Auth::user()->nv_ma;
                $xk->save();
                            

                $ctxk = new ChitietXuatkho();
                $ctxk->sp_ma = $request->sp_ma;
                $ctxk->xk_ma = $xk->xk_ma;
                $ctxk->ctxk_soluong = $request->xk_soluong;
                $ctxk->save();

                
            }else{
                return redirect(route('backend.xuatkho.create'))
                ->withErrors('Số lượng xuất phải lớn hơn 0 và nhỏ hơn số lượng hiện có')
                ->withInput();
            }
        }else{
            return redirect(route('backend.xuatkho.create'))
            ->withErrors('Số lượng sản phẩm hiện có trong kho bằng 0')
            ->withInput(); 
        }
        

        Session::flash('alert-success', 'Thêm mới thành công ^^~!!!');
        return redirect()->route('backend.xuatkho.index');
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
        $xk = Xuatkho::where("xk_ma", $id)->first();
        $ds_nhanvien = Nhanvien::all();

        return view('backend.xuatkho.edit')
            ->with('xuatkho', $xk)
            ->with('danhsachnhanvien', $ds_nhanvien);
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
        $xk = Xuatkho::find($id);
        $xk->xk_ngaylap = $request->input('xk_ngaylap');
        $xk->xk_diachi = $request->input('xk_diachi');
        $xk->xk_lydo = $request->input('xk_lydo');
        $xk->xk_tongtien = $request->input('xk_tongtien');
        $xk->nv_ma = $request->input('nv_ma');
        $xk->save();

        Session::flash('alert-warning', 'Cập nhật thành công ^^~!!!');
        return redirect()->route('backend.xuatkho.index');
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
        $xk = Xuatkho::find($id);
        $xk->xk_trangThai = 1;
        $xk->save();

        Session::flash('alert-danger', 'Xóa thành công ^^~!!!');
        return redirect()->route('backend.xuatkho.index');
    }

    public function repose($id)
    {
        //
        $xk = Xuatkho::find($id);
        $xk->xk_trangThai = 2;
        $xk->save();

        Session::flash('alert-info', 'Đặt lại thành công ^^~!!!');
        return redirect()->route('backend.xuatkho.index');
    }


    public function print($id){
        $xk = Xuatkho::where("xk_ma", $id)->first();
        $ctxk = ChitietXuatkho::all();
        return view('backend.xuatkho.print')
            ->with('xk', $xk)
            ->with('ctxk', $ctxk);
    }
}
