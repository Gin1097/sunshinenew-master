@extends('print.layout.paper')

@section('title')
Phiếu xuất
@endsection

@section('paper-size') A4 @endsection
@section('paper-class') A4 @endsection

@section('custom-css')
<style>
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
<body onload="window.print();">
<div id="page" class="page">
<div class= "header">
    <div class="date-right">{{ $xk->xk_ngaylap }}</div>
    </div>
    <div class="header">
        <img src="{{ asset('img/f-shop.png') }}" class="logo" />
        <div class="company">C.Ty sỉ & lẻ hoa tươi F-Shop</div>
        <div class= "info"><b>Địa chỉ : </b>{{ $xk->xk_diachi }}</div>
        <div class= "info"><b>Lý do : </b>{{ $xk->xk_lydo }}</div>
        
    </div>
    
  <br/>
  <div class="title">
         PHIẾU XUẤT KHO
        <br/>
        -------oOo-------
  </div>
  <br/>
  <br/>
  <table class="TableData">
    <tr>
      <th>STT</th>
      <th>Tên sản phẩm</th>
      <th>Số lượng</th>
      <th>Đơn giá</th>
    </tr><?php
    $stt = 1;
    ?>
    @foreach ($ctxk as $str)
    
        @if ($xk->xk_ma == $str->xk_ma)
            <tr>
            <td class=\"cotSTT\">{{ $stt }}</td>
            <td class=\"cotTenSanPham\">{{ $str->sanpham->sp_ten }}</td>
            <td class=\"cotSoLuong\" align='center'>{{ $str->ctxk_soluong }}</td>
            <td class=\"cotGia\">{{ number_format($xk->xk_tongtien/$str->ctxk_soluong,0,",",".") }} vnd</td>
            </tr> 
        <?php
        $stt++;
        ?>    
        @endif
    @endforeach
    <tr>
      <td colspan="3" class="tong">Tổng cộng</td>
      <td class="cotGia"><?php echo number_format(($xk->xk_tongtien),0,",",".")?> vnd</td>
    </tr>
    </table>
    <div class="text-tong">TỔNG (viết bằng chữ): ..................................................................................................................................................................

        .........................................................................................................................................................................................................
    </div>
    <div class="footer-left"> Cần thơ, ngày ... tháng ... năm 20..<br/>
    Nhân viên lập phiếu xuất <br />
    <br />
    {{ $xk->nhanvien->nv_hoTen }}</div>
</div>
</body>
@endsection
   