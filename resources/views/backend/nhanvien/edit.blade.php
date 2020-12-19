@extends('backend.layout.master')

@section('title')
Sửa Nhân viên
@endsection

@section('feature-title')
Sửa Nhân viên    
@endsection

@section('feature-description')
Sửa Nhân viên. Vui lòng nhập thông tin và bấm Lưu.<div class="alert alert-danger"><strong><h6><b>Lưu ý :</b></h6></strong> Sau khi bấm lưu mật khẩu mặc định là (<b>123456</b>)</div>
@endsection

@section('custom-css')
<!-- Các style dành cho thư viện Daterangepicker -->
<link href="{{ asset('vendor/daterangepicker/daterangepicker.css') }}" type="text/css" rel="stylesheet" />
@endsection

@section('content')
<form method="post" action="{{ route('backend.nhanvien.update', ['id' => $nv->nv_ma]) }}">
    {{ csrf_field() }}
    <input type="hidden" name="_method" value="PUT" />
    <div class="form-group">
        <label for="q_ma">Quyền nhân viên</label>
        <select name="q_ma" class="form-control">
            @foreach($danhsachquyen as $quyen)
                @if(old('q_ma', $nv->q_ma) == $quyen->q_ma)
                <option value="{{ $quyen->q_ma }}" selected>{{ $quyen->q_ten }}</option>
                @else
                <option value="{{ $quyen->q_ma }}">{{ $quyen->q_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="nv_hoTen">Tên nhân viên</label>
        <input type="text" class="form-control" id="nv_hoTen" name="nv_hoTen" value="{{ old('nv_hoTen', $nv->nv_hoTen) }}">
    </div>
    <div class="form-group">
        <label for="nv_ngaySinh">Ngày sinh</label>
        <input type="text" class="form-control" id="nv_ngaySinh" name="nv_ngaySinh" value="{{ old('nv_ngaySinh', $nv->nv_ngaySinh) }}">
    </div>
    <div class="form-group">
        <label for="nv_taiKhoan">Tài khoản</label>
        <input type="text" class="form-control" id="nv_taiKhoan" name="nv_taiKhoan" value="{{ old('nv_taiKhoan', $nv->nv_taiKhoan) }}">
    </div>
    <div class="form-group">
        <label for="nv_dienThoai">Điện thoại</label>
        <input type="number" class="form-control" id="nv_dienThoai" name="nv_dienThoai" value="{{ old('nv_dienThoai', $nv->nv_dienThoai) }}">
    </div>
    <div class="form-group">
        <label for="nv_diaChi">Địa chỉ</label>
        <input type="text" class="form-control" id="nv_diaChi" name="nv_diaChi" value="{{ old('nv_diaChi', $nv->nv_diaChi) }}">
    </div>
    <div class="form-group">
        <label for="nv_gioiTinh">Giới tính</label>
        <select name="nv_gioiTinh" class="form-control">
                @if(old('nv_gioiTinh') == $nv->nv_gioiTinh)
                <option value="{{ $nv->nv_gioiTinh }}" selected>{{ $nv->nv_gioiTinh }}</option>
                <option value="1">Nam</option>
                <option value="0">Nữ</option>
                <option value="2">Khác</option>
                @else
                <option value="1">Nam</option>
                <option value="0">Nữ</option>
                <option value="2">Khác</option>
                @endif
        </select>
    </div>
    <div class="form-group">
        <label for="nv_email">Email</label>
        <input type="email" class="form-control" id="nv_email" name="nv_email" value="{{ old('nv_email', $nv->nv_email) }}">
    </div>
    
    <div class="form-group">
        <label for="nv_trangThai">Trạng thái</label>
        <select name="nv_trangThai" class="form-control">
            <option value="2" {{ old('nv_trangThai') == 2 ? "selected" : "" }}>Khả dụng</option>
            <option value="1" {{ old('nv_trangThai') == 1 ? "selected" : "" }}>Khóa</option>
        </select>
    </div>
    <button class="btn btn-primary">Lưu</button>
</form>
@endsection
@section('custom-scripts')


@endsection