@extends('backend.layout.master')

@section('title')
Thêm mới Sản phẩm
@endsection

@section('feature-title')
Thêm mới Sản phẩm    
@endsection

@section('feature-description')
Thêm mới Sản phẩm. Vui lòng nhập thông tin và bấm Lưu.
@endsection

@section('custom-css')
<style>
    .preview-upload {
        border: 1px dashed red;
        padding: 10px;
    }
    .preview-upload img {
        width: 100%;
    }
</style>
<!-- Các css dành cho thư viện bootstrap-fileinput -->
<link href="{{ asset('vendor/bootstrap-fileinput/css/fileinput.css') }}" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
<link href="{{ asset('vendor/bootstrap-fileinput/themes/explorer-fas/theme.css') }}" media="all" rel="stylesheet" type="text/css"/>
@endsection

@section('content')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form method="post" action="{{ route('backend.sanpham.store') }}" enctype="multipart/form-data">
    {{ csrf_field() }}
    <div class="form-group">
        <label for="l_ma">Loại sản phẩm</label>
        <select name="l_ma" class="form-control">
            @foreach($danhsachloai as $loai)
                @if(old('l_ma') == $loai->l_ma)
                <option value="{{ $loai->l_ma }}" selected>{{ $loai->l_ten }}</option>
                @else
                <option value="{{ $loai->l_ma }}">{{ $loai->l_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="dvt_ma">Đơn vị tính</label>
        <select name="dvt_ma" class="form-control">
            @foreach($danhsachdonvitinh as $donvitinh)
                @if(old('dvt_ma') == $donvitinh->dvt_ma)
                <option value="{{ $donvitinh->dvt_ma }}" selected>{{ $donvitinh->dvt_ten }}</option>
                @else
                <option value="{{ $donvitinh->dvt_ma }}">{{ $donvitinh->dvt_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="kho_ma">Kho</label>
        <select name="kho_ma" class="form-control">
            @foreach($danhsachkho as $kho)
                @if(old('kho_ma') == $kho->kho_ma)
                <option value="{{ $kho->kho_ma }}" selected>{{ $kho->kho_ten }}</option>
                @else
                <option value="{{ $kho->kho_ma }}">{{ $kho->kho_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sp_ten">Tên sản phẩm</label>
        <input type="text" class="form-control" id="sp_ten" name="sp_ten" value="{{ old('sp_ten') }}">
    </div>
    <div class="form-group">
        <label for="sp_giaGoc">Giá gốc</label>
        <input type="number" class="form-control" id="sp_giaGoc" name="sp_giaGoc" value="{{ old('sp_giaGoc') }}">
    </div>
    <div class="form-group">
        <label for="sp_giaGoc">Giá bán</label>
        <input type="number" class="form-control" id="sp_giaBan" name="sp_giaBan" value="{{ old('sp_giaBan') }}">
    </div>
    <div class="form-group">
        <div class="file-loading">
            <label>Hình đại diện</label>
            <input id="sp_hinh" type="file" name="sp_hinh">
            <div class="preview-upload">
                <img id='sp_hinh-upload'/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="sp_thongTin">Thông tin</label>
        <input type="text" class="form-control" id="sp_thongTin" name="sp_thongTin" value="{{ old('sp_thongTin') }}">
    </div>
    <div class="form-group">
        <label for="sp_danhGia">Đánh giá</label>
        <input type="text" class="form-control" id="sp_danhGia" name="sp_danhGia" value="{{ old('sp_danhGia') }}">
    </div>
    <div class="form-group">
        <label for="m_ma">Màu</label>
        <select name="m_ma" class="form-control">
            @foreach($danhsachmau as $mau)
                @if(old('m_ma') == $mau->m_ma)
                <option value="{{ $mau->m_ma }}" selected>{{ $mau->m_ten }}</option>
                @else
                <option value="{{ $mau->m_ma }}">{{ $mau->m_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sp_soLuong">Số lượng</label>
        <input type="number" class="form-control" id="sp_soLuong" name="sp_soLuong" value="{{ old('sp_soLuong') }}">
    </div>
    <div class="form-group">
        <label for="cd_ma">Chủ đề</label>
        <select name="cd_ma" class="form-control">
            @foreach($danhsachchude as $chude)
                @if(old('cd_ma') == $chude->cd_ma)
                <option value="{{ $chude->cd_ma }}" selected>{{ $chude->cd_ten }}</option>
                @else
                <option value="{{ $chude->cd_ma }}">{{ $chude->cd_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sp_trangThai">Trạng thái</label>
        <select name="sp_trangThai" class="form-control">
            <option value="1" {{ old('sp_trangThai') == 1 ? "selected" : "" }}>Khóa</option>
            <option value="2" {{ old('sp_trangThai') == 2 ? "selected" : "" }}>Khả dụng</option>
        </select>
    </div>
    <div class="form-group">
        <div class="file-loading">
            <label>Hình ảnh liên quan sản phẩm</label>
            <input id="sp_hinhanhlienquan" type="file" name="sp_hinhanhlienquan[]" multiple>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Lưu</button>
</form>
@endsection

@section('custom-scripts')
<!-- Các script dành cho thư viện bootstrap-fileinput -->
<script src="{{ asset('vendor/bootstrap-fileinput/js/plugins/sortable.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/bootstrap-fileinput/js/fileinput.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/bootstrap-fileinput/js/locales/fr.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/bootstrap-fileinput/themes/fas/theme.js') }}" type="text/javascript"></script>
<script src="{{ asset('vendor/bootstrap-fileinput/themes/explorer-fas/theme.js') }}" type="text/javascript"></script>
<script>
    $(document).ready(function() {
        $("#sp_hinh").fileinput({
            theme: 'fas',
            showUpload: false,
            showCaption: false,
            browseClass: "btn btn-primary btn-lg",
            fileType: "any",
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            overwriteInitial: false
        });
        $("#sp_hinhanhlienquan").fileinput({
            theme: 'fas',
            showUpload: false,
            showCaption: false,
            browseClass: "btn btn-primary btn-lg",
            fileType: "any",
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            overwriteInitial: false,
            allowedFileExtensions: ["jpg", "gif", "png", "txt"]
        });
        function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#sp_hinh-upload').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
        }
    // Bắt sự kiện, ngay khi thay đổi file thì đọc lại nội dung và hiển thị lại hình ảnh mới trên khung preview-upload
        $("#sp_hinh").change(function(){
            readURL(this);
        }); 
    });
</script>
<!-- Các script dành cho thư viện Mặt nạ nhập liệu InputMask -->
<script src="{{ asset('theme/adminlte/plugins/input-mask/jquery.inputmask.js') }}"></script>
<script src="{{ asset('theme/adminlte/plugins/input-mask/jquery.inputmask.date.extensions.js') }}"></script>
<script src="{{ asset('theme/adminlte/plugins/input-mask/jquery.inputmask.extensions.js') }}"></script>
<script>
$(document).ready(function(){
    
});
</script>
@endsection