@extends('print.layout.paper')

@section('title')
Biểu mẫu Phiếu in danh sách sản phẩm
@endsection

@section('paper-size') A4 @endsection
@section('paper-class') A4 @endsection

@section('custom-css')
<style>
.sanpham-thumbnail {
    width: 100px;
    height: 100px;
}
.logo {
    width: 200px;
    height: 200px;
}
body {
    margin: 0;
    padding: 0;
    background-color: #FAFAFA;
    font: 12pt "Tohoma";
}
* {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
.page {
    width: 21cm;
    overflow:hidden;
    min-height:297mm;
    padding: 2.5cm;
    margin-left:auto;
    margin-right:auto;
    background: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}
.subpage {
    padding: 1cm;
    border: 5px red solid;
    height: 237mm;
    outline: 2cm #FFEAEA solid;
}
 @page {
 size: A4;
 margin: 0;
}
button {
    width:100px;
    height: 24px;
}
.header {
    overflow:hidden;
}
.logo {
    background-color:#FFFFFF;
    text-align:left;
    float:left;
    width: 100px;
    height: 100px;
}
.company {
    padding-top:24px;
    text-transform:uppercase;
    background-color:#FFFFFF;
    float:none;
    font-size:16px;
}
.info {
    background-color:#FFFFFF;
    float:none;
    font-size:12px;
}
.date-right {
    background-color:#FFFFFF;
    float:right;
    font-size:12px;
}
.title {
    text-align:center;
    position:relative;
    color:#ff5050;
    font-size: 24px;
    top:1px;
}
.footer-left {
    text-align:center;
    text-transform:uppercase;
    padding-top:24px;
    position:relative;
    height: 150px;
    width:50%;
    color:#000;
    float:left;
    font-size: 12px;
    bottom:1px;
}
.footer-right {
    text-align:center;
    text-transform:uppercase;
    padding-top:24px;
    position:relative;
    height: 150px;
    width:50%;
    color:#000;
    font-size: 12px;
    float:right;
    bottom:1px;
}
.footer-center {
    text-align:center;
    text-transform:uppercase;
    padding-top:100px;
    position:relative;
    height: 150px;
    width:50%;
    color:#000;
    font-size: 12px;
    float:none;
    bottom:1px;
}
.text-tong{
    padding-top:24px;
    position:relative;
    color:#000;
    font-size: 12px;
}
.TableData {
    background:#ffffff;
    font: 11px;
    width:100%;
    border-collapse:collapse;
    font-family:Verdana, Arial, Helvetica, sans-serif;
    font-size:12px;
    border:thin solid #d3d3d3;
}
.TableData TH {
    text-align: center;
    font-weight: bold;
    border: solid 1px #ccc;
    height: 24px;
}
.TableData TR {
    height: 24px;
    border:thin solid #d3d3d3;
}
.TableData TR TD {
    padding-right: 2px;
    padding-left: 2px;
    border:thin solid #d3d3d3;
}
.TableData TR:hover {
    background: rgba(0,0,0,0.05);
}
.TableData .cotSTT {
    text-align:center;
    width: 10%;
}
.TableData .cotTenSanPham {
    text-align:left;
    width: 40%;
}
.TableData .cotHangSanXuat {
    text-align:left;
    width: 20%;
}
.TableData .cotGia {
    text-align:right;
    width: 120px;
}
.TableData .cotSoLuong {
    text-align: center;
    width: 50px;
}
.TableData .cotSo {
    text-align: right;
    width: 120px;
}
.TableData .tong {
    text-align: right;
    font-weight:bold;
    text-transform:uppercase;
    padding-right: 4px;
}
.TableData .cotSoLuong input {
    text-align: center;
}
@media print {
 @page {
 margin: 0;
 border: initial;
 border-radius: initial;
 width: initial;
 min-height: initial;
 box-shadow: initial;
 background: initial;
 page-break-after: always;
}
}
</style>
@endsection

@section('content')
<section class="sheet padding-10mm">
    <article>
            <div class="header">
            <img src="{{ asset('img/f-shop.png') }}" class="logo" />
                <div class="company">Công ty TNHH F-Shop</div>
                <div class= "info"><b>http://f-shop.com/</b></div>
                <div class= "info">(0292)3.888.999 # 01.222.888.999</div>
            </div>    
        <?php 
        $tongSoTrang = ceil(count($danhsachsanpham)/5);
            ?>
              
        <table class="TableData">
        <div class="title">
            Danh sách sản phẩm
        </div>
            <tr>
                <th colspan="6" align="center">Trang 1 / {{ $tongSoTrang }}</th>
            </tr>
            <tr>
                <th>STT</th>
                <th>Hình sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Giá gốc</th>
                <th>Giá bán</th>
                <th>Loại sản phẩm</th>
            </tr>
            @foreach ($danhsachsanpham as $sp)
            <tr>
                <td class=\"cotSTT\">{{ $loop->index + 1 }}</td>
                <td class=\"cotSoLuong\" align='center'>
                    <img class="sanpham-thumbnail" src="{{ asset('storage/photos/' . $sp->sp_hinh) }}" />
                </td>
                <td class=\"cotTenSanPham\">{{ $sp->sp_ten }}</td>
                <td class=\"cotGia\">{{ $sp->sp_giaGoc }}</td>
                <td class=\"cotGia\">{{ $sp->sp_giaBan }}</td>
                @foreach ($danhsachloai as $l)
                @if ($sp->l_ma == $l->l_ma)
                <td class=\"cotGia\">{{ $l->l_ten }}</td>
                @endif
                @endforeach
            </tr>
            @if (($loop->index + 1) % 5 == 0)
        </table>
        <div class="page-break"></div>
        <table class="TableData" cellpadding="5">
            <tr>
                <th colspan="6" align="center">Trang {{ 1 + floor(($loop->index + 1) / 5) }} / {{ $tongSoTrang }}</th>
            </tr>
            <tr>
                <th>STT</th>
                <th>Hình sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Giá gốc</th>
                <th>Giá bán</th>
                <th>Loại sản phẩm</th>
            </tr>
            @endif
            @endforeach
        </table>
    </article>
</section>
@endsection
   