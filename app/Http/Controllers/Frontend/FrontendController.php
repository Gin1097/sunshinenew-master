<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Loai;
use App\Mau;
use App\Sanpham;
use App\Vanchuyen;
use App\Khachhang;
use App\Donhang;
use App\Thanhtoan;
use App\Chitietdonhang;
use Carbon\Carbon;
use DB;
use Mail;
use App\Mail\ContactMailer;
use App\Mail\OrderMailer;

class FrontendController extends Controller
{
    /**
     * Action hiển thị view Trang chủ
     * GET /
     */
    public function index(Request $request)
    {
        // Query top 3 loại sản phẩm (có sản phẩm) mới nhất
        // Eloquent MODEL, Query Builder DB
        $ds_top3_newest_loaisanpham = 
            DB::table('loai')
            ->join('sanpham', 'loai.l_ma', '=', 'sanpham.l_ma')
            ->orderBy('l_capNhat', 'DESC')
            ->orderBy('sp_capNhat', 'DESC')
            ->take(3)
            ->get();

        // Query tìm danh sách sản phẩm
        $danhsachsanpham = DB::table('sanpham')
        ->where('sp_trangThai', 2)
        ->orderBy('sp_CapNhat', 'DESC')
        ->paginate(12);

        // Query Lấy các hình ảnh liên quan của các Sản phẩm đã được lọc
        $danhsachhinhanhlienquan = DB::table('hinhanh')
            ->whereIn('sp_ma', $danhsachsanpham->pluck('sp_ma')->toArray())
            ->get();

        // Query danh sách Loại
        $danhsachloai = Loai::all();

        // Query danh sách màu
        $danhsachmau = Mau::all();

        // Hiển thị view `frontend.index` với dữ liệu truyền vào
        return view('frontend.index')
            ->with('ds_top3_newest_loaisanpham', $ds_top3_newest_loaisanpham)
            ->with('danhsachsanpham', $danhsachsanpham)
            ->with('danhsachhinhanhlienquan', $danhsachhinhanhlienquan)
            ->with('danhsachmau', $danhsachmau)
            ->with('danhsachloai', $danhsachloai);
    }

    /** * Action hiển thị view Liên hệ * GET /contact */
    public function contact()
    {
        return view('frontend.pages.contact');
    }

    /** 
     * Action gởi email với các lời nhắn nhận được từ khách hàng 
     * POST /lien-he/goi-loi-nhan 
     */
    public function sendMailContactForm(Request $request)
    {
        $input = $request->all();
        Mail::to('quanb1510856@gmail.com')->send(new ContactMailer($input));
        return $input;
    }

    /**
     * Action hiển thị view Giới thiệu
     * GET /about
     */
    public function about()
    {
        return view('frontend.pages.about');
    }

    /**
     * Action hiển thị danh sách Sản phẩm
     */
    public function product(Request $request)
    {
        // Query tìm danh sách sản phẩm
        $danhsachsanpham = DB::table('sanpham')
        ->where('sp_trangThai', 2)
        ->orderBy('sp_CapNhat', 'DESC')
        ->paginate(12);
        // Query Lấy các hình ảnh liên quan của các Sản phẩm đã được lọc
        $danhsachhinhanhlienquan = DB::table('hinhanh')
            ->whereIn('sp_ma', $danhsachsanpham->pluck('sp_ma')->toArray())
            ->get();

        // Query danh sách Loại
        $danhsachloai = Loai::all();

        // Query danh sách màu
        $danhsachmau = Mau::all();

        // Hiển thị view `frontend.index` với dữ liệu truyền vào
        return view('frontend.pages.product')
            ->with('danhsachsanpham', $danhsachsanpham)
            ->with('danhsachhinhanhlienquan', $danhsachhinhanhlienquan)
            ->with('danhsachmau', $danhsachmau)
            ->with('danhsachloai', $danhsachloai);
    }

    /**
     * Action hiển thị chi tiết Sản phẩm
     */
    public function productDetail(Request $request, $id)
    {
        $sanpham = SanPham::find($id);

        // Query Lấy các hình ảnh liên quan của các Sản phẩm đã được lọc
        $danhsachhinhanhlienquan = DB::table('hinhanh')
            ->where('sp_ma', $id)
            ->get();

        // Query danh sách Loại
        $danhsachloai = Loai::all();

        // Query danh sách màu
        $danhsachmau = Mau::all();

        return view('frontend.pages.product-detail')
            ->with('sp', $sanpham)
            ->with('danhsachhinhanhlienquan', $danhsachhinhanhlienquan)
            ->with('danhsachmau', $danhsachmau)
            ->with('danhsachloai', $danhsachloai);
    }

    /**
     * Action hiển thị giỏ hàng
     */
    public function cart(Request $request){

        // Query danh sách hình thức vận chuyển
        $danhsachvanchuyen = Vanchuyen::all();
        // Query danh sách phương thức thanh toán
        $danhsachphuongthucthanhtoan = Thanhtoan::all();
        return view('frontend.pages.shopping-cart')
            ->with('danhsachvanchuyen', $danhsachvanchuyen)
            ->with('danhsachphuongthucthanhtoan', $danhsachphuongthucthanhtoan);
    }
    /**
     * Action Đặt hàng
     */
    public function order(Request $request)
    {
        // dd($request);
        // Data gởi mail
        $dataMail = [];
            // Tạo mới khách hàng
            $email_kh = 'quanb1510856@gmail.com';
            // Tạo mới đơn hàng
            $donhang = new Donhang();
            $donhang->kh_ma = 100;
            $donhang->dh_thoiGianDatHang = Carbon::now();
            $donhang->dh_thoiGianNhanHang = $request->donhang['dh_thoiGianNhanHang'];
            $donhang->dh_nguoiNhan = $request->donhang['dh_nguoiNhan'];
            $donhang->dh_diaChi = $request->donhang['dh_diaChi'];
            $donhang->dh_dienThoai = $request->donhang['dh_dienThoai'];
            $donhang->dh_nguoiGui = $request->donhang['dh_nguoiGui'];
            $donhang->dh_loiChuc = $request->donhang['dh_loiChuc'];
            $donhang->dh_daThanhToan = 0; //Chưa thanh toán
            $donhang->nv_xuLy = 1; //Mặc định nhân viên đầu tiên
            $donhang->nv_giaoHang = 1; //Mặc định nhân viên đầu tiên
            $donhang->dh_trangThai = 1; //Nhận đơn
            $donhang->vc_ma = $request->donhang['vc_ma'];
            $donhang->tt_ma = $request->donhang['tt_ma'];
            $donhang->save();
            $dataMail['donhang'] = $donhang->toArray();
            // Lưu chi tiết đơn hàng
            foreach ($request->giohang['items'] as $sp) {
                $chitietdonhang = new Chitietdonhang();
                $chitietdonhang->dh_ma = $donhang->dh_ma;
                $chitietdonhang->sp_ma = $sp['_id'];
                $chitietdonhang->m_ma = 1;
                $chitietdonhang->ctdh_soLuong = $sp['_quantity'];
                $chitietdonhang->ctdh_donGia = $sp['_price'];
                $chitietdonhang->save();
                $dataMail['donhang']['chitiet'][] = $chitietdonhang->toArray();
                $dataMail['donhang']['giohang'][] = $sp;
            }
            // Gởi mail khách hàng
            // dd($dataMail);
            Mail::to('quanb1510856@gmail.com')
                ->send(new OrderMailer($dataMail));
                return $dataMail;
            return response()->json(array(
                'code'  => 200,
                'message' => 'Tạo đơn hàng thành công!',
                'redirectUrl' => route('frontend.orderFinish')
            ));
    }
    /**
     * Action Hoàn tất Đặt hàng
     */
    public function orderFinish()
    {
        return view('frontend.pages.order-finish');
    }

    /**
     * Hàm query danh sách sản phẩm theo nhiều điều kiện
     */
    private function searchSanPham(Request $request)
    {
        $query = DB::table('sanpham')->select('*');
        // Kiểm tra điều kiện `searchByLoaiMa`
        $searchByLoaiMa = $request->query('searchByLoaiMa');
        if ($searchByLoaiMa != null) { }

        $data = $query->get();
        return $data;
    }
    public function search(Request $req){
        $product = Sanpham::where('sp_ten','like','%'.$req->key.'%')
                            ->orWhere('sp_giaBan',$req->key)
                            ->get();
        $danhsachsanpham = $this->searchSanPham($req);
                
                        // Query Lấy các hình ảnh liên quan của các Sản phẩm đã được lọc
        $danhsachhinhanhlienquan = DB::table('hinhanh')
                            ->whereIn('sp_ma', $danhsachsanpham->pluck('sp_ma')->toArray())
                            ->get();
                
                        // Query danh sách Loại
        $danhsachloai = Loai::all();
                
                        // Query danh sách màu
        $danhsachmau = Mau::all();
        return view('frontend.widgets.search')
            ->with('danhsachsanpham', $danhsachsanpham)
            ->with('danhsachhinhanhlienquan', $danhsachhinhanhlienquan)
            ->with('danhsachmau', $danhsachmau)
            ->with('danhsachloai', $danhsachloai)
            ->with('product', $product);
    }
}
