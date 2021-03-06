@extends('backend.layout.master')

@section('title')
Thêm mới phiếu chuyển kho
@endsection

@section('feature-title')
Thêm mới phiếu chuyển kho
@endsection

@section('feature-description')
Thêm mới phiếu chuyển kho. Vui lòng nhập thông tin và bấm Lưu.
@endsection

@section('content')
<form id="frmLoai" name="frmLoai" method="post" action="{{ route('backend.chuyenkho.store') }}">
    {{ csrf_field() }}
    
    <div class="form-group">
        <label for="ck_lydo">Lý do</label>
        <input type="text" class="form-control" id="ck_lydo" name="ck_lydo" placeholder="Nhập lý do" value="{{ old('ck_lydo') }}">
    </div>
    <hr />
    <div class="form-group">
        <label for="sp_ma">Sản phẩm</label>
        <select name="sp_ma" id="sp_ma" class="form-control">
            @foreach($danhsachsanpham as $str)
                @if(old('sp_ma') == $str->sp_ma)
                <option value="{{ $str->sp_ma }}" selected>{{ $str->sp_ten }}</option>
                @else
                <option value="{{ $str->sp_ma }}">{{ $str->sp_ten }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="khocu_ma">Từ kho</label>
        <select name="khocu_ma" id="khocu_ma" class="form-control">
            @foreach($danhsachsanpham as $str)
                @if(old('kho_ma') == $str->kho_ma)
                <option value="{{ $str->kho_ma }}" selected>{{ $str->kho_ma }}</option>
                @else
                <option value="{{ $str->kho_ma }}">{{ $str->kho_ma }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="kho_ma">Đến kho</label>
        <select name="kho_ma" id="kho_ma" class="form-control">
            @foreach($danhsachkho as $kho)
                @if(old('kho_ma') == $kho->kho_ma)
                <option value="{{ $kho->kho_ma }}" selected>{{ $kho->kho_ma."_".$kho->kho_ten }}</option>
                @else
                <option value="{{ $kho->kho_ma }}">{{ $kho->kho_ma."_". $kho->kho_ten  }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sp_giaGoc">Giá gốc</label>
        <select name="sp_giaGoc" id="sp_giaGoc" class="form-control" >
            @foreach($danhsachsanpham as $str)
                @if(old('sp_giaGoc') == $str->sp_giaGoc)
                <option value="{{ $str->sp_giaGoc }}" selected>{{ $str->sp_giaGoc }}</option>
                @else
                <option value="{{ $str->sp_giaGoc }}">{{ $str->sp_giaGoc }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sl_ton">Số lượng còn lại trong kho</label>
        <select name="sl_ton" id="sl_ton" class="form-control">
            @foreach($danhsachsanphamkho as $str1)
                @if(old('kho_ma') == $str1->kho_ma)
                <option value="{{ $str1->sl_ton }}" selected>{{ $str->sl_ton }}</option>
                @else
                <option value="{{ $str1->sl_ton }}">{{ $str->sl_ton }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sl_xuat">Số lượng đã xuất kho</label>
        <select name="sl_xuat" id="sl_xuat" class="form-control" >
            @foreach($danhsachsanphamkho as $str1)
                @if(old('kho_ma') == $str1->kho_ma)
                <option value="{{ $str1->sl_xuat }}" selected>{{ $str->sl_xuat }}</option>
                @else
                <option value="{{ $str1->sl_xuat }}">{{ $str->sl_xuat }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="sl_nhap">Số lượng nhập ban đầu</label>
        <select name="sl_nhap" id="sl_nhap" class="form-control" >
            @foreach($danhsachsanphamkho as $str1)
                @if(old('kho_ma') == $str1->kho_ma)
                <option value="{{ $str1->sl_nhap }}" selected>{{ $str->sl_nhap }}</option>
                @else
                <option value="{{ $str1->sl_nhap }}">{{ $str->sl_nhap }}</option>
                @endif
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="ck_soluong">Số lượng chuyển</label>
        <input type="text" class="form-control" id="ck_soluong" name="ck_soluong" placeholder="Nhập số lượng" value="{{ old('ck_soluong') }}" max="$str->sl_ton">
    </div>
    <button class="btn btn-primary">Lưu</button>
</form>
@endsection

@section('custom-scripts')
<script>
    $(document).ready(function () {
        $("#sp_ma").change(function(){
            var idSanpham = $(this).val();
            $.get("/admin/sanpham/"+idSanpham,function(data){
                $("#sp_giaGoc").html(data);
            });
            $.get("/admin/kho/"+idSanpham, function(data){
                $("#khocu_ma").html(data);
            });
            $.get("/admin/sanphamkho/"+idSanpham, function(data){
                $("#sl_ton").html(data);
            });
            $.get("/admin/sanphamkho2/"+idSanpham, function(data){
                $("#sl_xuat").html(data);
            });
            $.get("/admin/sanphamkho1/"+idSanpham, function(data){
                $("#sl_nhap").html(data);
            });
        });
        $("#frmLoai").validate({
            rules: {
                
                ck_lydo: {
                    required: true,
                    minlength: 3,
                    maxlength: 50,
                },
                sp_ma: {
                    required: true,
                },
                kho_ma: {
                    required: true, 
                },
                ck_soluong: {
                    required: true,
                },
            },
            messages: {
                
                ck_lydo: {
                    required: "Vui lòng nhập lý do xuất kho",
                    minlength: "Lý do phải có ít nhất 3 ký tự",
                    maxlength: "Lý do không được vượt quá 50 ký tự"
                },
                
                sp_ma: {
                    required: "Vui lòng chọn sản phẩm",
                },
                kho_ma: {
                    required: "Kho không được để trống", 
                },
                
                ck_soluong: {
                    required: "Vui lòng nhập số lượng sản phẩm cần xuất kho",
                }
            },
            errorElement: "em",
            errorPlacement: function (error, element) {
                // Thêm class `invalid-feedback` cho field đang có lỗi
                error.addClass("invalid-feedback");
                if (element.prop("type") === "checkbox") {
                    error.insertAfter(element.parent("label"));
                } else {
                    error.insertAfter(element);
                }
                // Thêm icon "Kiểm tra không Hợp lệ"
                if (!element.next("span")[0]) {
                    $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>")
                        .insertAfter(element);
                }
            },
            success: function (label, element) {
                // Thêm icon "Kiểm tra Hợp lệ"
                if (!$(element).next("span")[0]) {
                    $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>")
                        .insertAfter($(element));
                }
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass("is-invalid").removeClass("is-valid");
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).addClass("is-valid").removeClass("is-invalid");
            }
        });
        
    });
</script>
@endsection