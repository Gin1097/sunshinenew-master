@extends('backend.layout.master')

@section('title')
Xử lý đơn hàng
@endsection

@section('feature-title')
Xử lý đơn hàng   
@endsection

@section('feature-description')
Xử lý đơn hàng. Vui lòng nhập thông tin và bấm Lưu.
@endsection

@section('content')
<form method="post" action="{{ route('backend.donhang.xulyupdate', ['id' => $dh->dh_ma]) }}" enctype="multipart/form-data">
    {{ csrf_field() }}
    <input type="hidden" name="_method" value="PUT" />
    <div class="form-group">
        <label for="nv_giaoHang">Nhân viên giao hàng</label>
        <select name="nv_giaoHang" class="form-control">
            @foreach($ds_nhanvien as $nv)
                <option value="{{ $nv->nv_ma }}" selected>{{ $nv->nv_hoTen }}</option>
            @endforeach
        </select>
    </div>
    @if(Auth::check())
    <div class="form-group">
        <input type="hidden" class="form-control" id="nv_xuLy" name="nv_xuLy" value="{{ old('nv_xuLy', Auth::user()->nv_ma) }}">
    </div>
    @endif
    </select>
    <button class="btn btn-primary">Lưu</button>
</form>
@endsection
@section('custom-scripts')

@endsection