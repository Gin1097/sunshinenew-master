@extends('backend.layout.master')

@section('title')
Thêm mới Nhân viên
@endsection

@section('feature-title')
Thêm mới Nhân viên    
@endsection

@section('feature-description')
Thêm mới Nhân viên. Vui lòng nhập thông tin và bấm Lưu.
@endsection
@section('custom-css')
<!-- Các style dành cho thư viện Daterangepicker -->
<link href="{{ asset('vendor/daterangepicker/daterangepicker.css') }}" type="text/css" rel="stylesheet" />
@endsection

@section('content')
<form method="post" action="{{ route('backend.nhanvien.store') }}">
    {{ csrf_field() }}
    <div class="form-group">
        <label for="q_ma">Quyền nhân viên</label>
        <select name="q_ma" class="form-control">
            @foreach($danhsachquyen as $quyen)
                @if(old('q_ma') == $quyen->q_ma) 
                <option value="{{ $quyen->q_ma }}" selected>{{ $quyen->q_ten }}</option>
                @else
                <option value="{{ $quyen->q_ma }}">{{ $quyen->q_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="nv_hoTen">Tên nhân viên</label>
        <input type="text" class="form-control" id="nv_hoTen" name="nv_hoTen" value="{{ old('nv_hoTen') }}">
    </div>
    <div class="form-group" >
        <label for="nv_ngaySinhDatepicker">Ngày sinh</label>
                <input id="nv_ngaySinhDatepicker" type="text" class="form-control">
    </div>
    <div class="form-group{{ $errors->has('nv_ngaySinh') ? ' has-error' : '' }}" style="display: none;">
        <label for="nv_ngaySinh" class="col-md-4 control-label">Ngày sinh</label>
            <div class="col-md-6">
                <input id="nv_ngaySinh" type="text" class="form-control" name="nv_ngaySinh" value="{{ old('nv_ngaySinh') }}" required autofocus>
                    @if ($errors->has('nv_ngaySinh'))
                        <span class="help-block">
                            <strong>{{ $errors->first('nv_ngaySinh') }}</strong>
                        </span>
                    @endif
            </div>
    </div>
    <div class="form-group">
        <label for="nv_taiKhoan">Tài khoản</label>
        <input type="text" class="form-control" id="nv_taiKhoan" name="nv_taiKhoan" value="{{ old('nv_taiKhoan') }}">
    </div>
    <div class="form-group">
        <label for="nv_matKhau">Mật khẩu</label>
        <input type="password" class="form-control" id="nv_matKhau" name="nv_matKhau" value="{{ old('nv_matKhau') }}">
    </div>
    <div class="form-group">
        <label for="nv_dienThoai">Điện thoại</label>
        <input type="number" class="form-control" id="nv_dienThoai" name="nv_dienThoai" value="{{ old('nv_dienThoai') }}">
    </div>
    <div class="form-group">
        <label for="nv_diaChi">Địa chỉ</label>
        <input type="text" class="form-control" id="nv_diaChi" name="nv_diaChi" value="{{ old('nv_diaChi') }}">
    </div>
    <div class="form-group">
        <label for="nv_gioiTinh">Giới tính:</label>
            <select name="nv_gioiTinh" id="nv_gioiTinh" class="form-control">
                <option value="0">Nữ</option>
                <option value="1">Nam</option>
                <option value="2">Khác</option>
            </select>
    </div>
    <div class="form-group">
        <label for="nv_email">Email</label>
        <input type="email" class="form-control" id="nv_email" name="nv_email" value="{{ old('nv_email') }}">
    </div>
    
    <div class="form-group">
    <select name="nv_trangThai" class="form-control">
        <option value="1" {{ old('nv_trangThai') == 1 ? "selected" : "" }}>Khóa</option>
        <option value="2" {{ old('nv_trangThai') == 2 ? "selected" : "" }}>Khả dụng</option>
    </select>
    </div>
    <button class="btn btn-primary">Lưu</button>
</form>
@endsection

@section('custom-scripts')
<script type="text/javascript" src="{{ asset('vendor/momentjs/moment.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/daterangepicker/daterangepicker.min.js') }}"></script>
<script>
    $(document).ready(function() {
        debugger;
        $('#nv_ngaySinhDatepicker').daterangepicker({
            "singleDatePicker": true,
            "showDropdowns": true,
            "showWeekNumbers": true,
            "showISOWeekNumbers": true,
            "timePicker": true,
            "timePicker24Hour": true,
            "locale": {
                "format": "DD/MM/YYYY",
                "separator": " - ",
                "applyLabel": "Đồng ý",
                "cancelLabel": "Hủy",
                "fromLabel": "Từ",
                "toLabel": "Đến",
                "customRangeLabel": "Tùy chọn",
                "weekLabel": "T",
                "daysOfWeek": [
                    "CN",
                    "T2",
                    "T3",
                    "T4",
                    "T5",
                    "T6",
                    "T7"
                ],
                "monthNames": [
                    "Tháng 1",
                    "Tháng 2",
                    "Tháng 3",
                    "Tháng 4",
                    "Tháng 5",
                    "Tháng 6",
                    "Tháng 7",
                    "Tháng 8",
                    "Tháng 9",
                    "Tháng 10",
                    "Tháng 11",
                    "Tháng 12",
                ],
                "firstDay": 1
            },
        }, function(start, end, label) {
            // Gán giá trị cho Ngày để gởi dữ liệu về Backend
            $('#nv_ngaySinh').val(start.format('YYYY-MM-DD HH:mm:ss'));
        });
        // callback function
    });
</script>
@endsection