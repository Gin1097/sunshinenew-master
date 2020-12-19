@extends('backend.layout.master')

@section('title')
Sửa đơn hàng
@endsection

@section('feature-title')
Sửa đơn hàng    
@endsection

@section('feature-description')
Sửa đơn hàng. Vui lòng nhập thông tin và bấm Lưu.
@endsection

@section('content')
<form method="post" action="{{ route('backend.donhang.update', ['id' => $dh->dh_ma]) }}" enctype="multipart/form-data">
    {{ csrf_field() }}
    <input type="hidden" name="_method" value="PUT" />
    <div class="form-group">
        <label for="kh_ma">Tên khách hàng</label>
        <select name="kh_ma" class="form-control">
            @foreach($danhsachkhachhang as $khachhang)
                @if(old('kh_ma', $dh->kh_ma) == $khachhang->kh_ma)
                <option value="{{ $khachhang->kh_ma }}" selected>{{ $khachhang->kh_hoTen }}</option>
                @else
                <option value="{{ $khachhang->kh_ma }}">{{ $khachhang->kh_hoTen }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="dh_nguoiNhan">Tên người nhận</label>
        <input type="text" class="form-control" id="dh_nguoiNhan" name="dh_nguoiNhan" value="{{ old('dh_nguoiNhan', $dh->dh_nguoiNhan) }}">
    </div>
    <div class="form-group">
        <label for="dh_diaChi">Địa chỉ</label>
        <input type="text" class="form-control" id="dh_diaChi" name="dh_diaChi" value="{{ old('dh_diaChi', $dh->dh_diaChi) }}">
    </div>
    <div class="form-group">
        <label for="dh_dienThoai">Điện thoại</label>
        <input type="number" class="form-control" id="dh_dienThoai" name="dh_dienThoai" value="{{ old('dh_dienThoai', $dh->dh_dienThoai) }}">
    </div>
    <div class="form-group">
        <label for="dh_nguoiGui">Người gửi</label>
        <input type="text" class="form-control" id="dh_nguoiGui" name="dh_nguoiGui" value="{{ old('dh_nguoiGui', $dh->dh_nguoiGui) }}">
    </div>
    <div class="form-group">
        <label for="dh_loiChuc">Lời chúc</label>
        <input type="text" class="form-control" id="dh_loiChuc" name="dh_loiChuc" value="{{ old('dh_loiChuc', $dh->dh_loiChuc) }}">
    </div>
    <div class="form-group">
        <label for="vc_ma">Vận chuyển</label>
        <select name="vc_ma" class="form-control">
            @foreach($danhsachvanchuyen as $vanchuyen)
                @if(old('vc_ma', $dh->vc_ma) == $vanchuyen->vc_ma)
                <option value="{{ $vanchuyen->vc_ma }}" selected>{{ $vanchuyen->vc_ten }}</option>
                @else
                <option value="{{ $vanchuyen->vc_ma }}">{{ $vanchuyen->vc_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="tt_ma">Thanh toán</label>
        <select name="tt_ma" class="form-control">
            @foreach($danhsachthanhtoan as $thanhtoan)
                @if(old('tt_ma', $dh->tt_ma) == $thanhtoan->tt_ma)
                <option value="{{ $thanhtoan->tt_ma }}" selected>{{ $thanhtoan->tt_ten }}</option>
                @else
                <option value="{{ $thanhtoan->tt_ma }}">{{ $thanhtoan->tt_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <button class="btn btn-primary">Lưu</button>
</form>
@endsection
@section('custom-scripts')

@endsection