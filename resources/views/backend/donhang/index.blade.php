@extends('backend.layout.master')

@section('title')
Danh sách đơn hàng
@endsection

@section('feature-title')
Danh sách đơn hàng
@endsection

@section('feature-description')
Danh sách các loại đơn hàng có trong Hệ thống. Bạn có thể CRUD!
@endsection

@section('content')
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>Mã đơn hàng</th>
            <th>Tên khách hàng</th>
            <th>Người nhận</th>
            <th>Địa chỉ</th>
            <th>Điện thoại</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        @foreach($danhsachdonhang as $donhang)
        <tr>
            <td>{{ $donhang->dh_ma }}</td>
            <td>{{ $donhang->khachhangdonhang->kh_hoTen }}</td>
            <td>{{ $donhang->dh_nguoiNhan }}</td>
            <td>{{ $donhang->dh_diaChi }}</td>
            <td>{{ $donhang->dh_dienThoai }}</td>
            <td>
                @if($donhang->dh_trangThai == 1)
                <a href="{{ route('backend.donhang.xuly', ['id' => $donhang->dh_ma]) }}" class="btn btn-info">Xác nhận</a>
                <a href="{{ route('backend.donhang.edit', ['id' => $donhang->dh_ma]) }}" class="btn btn-warning">Sửa</a>
                @endif            
                @if($donhang->dh_trangThai == 2)
                    <form class="d-inline" method="post" action="{{ route('backend.donhang.giao', ['id' => $donhang->dh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-success">Giao hàng</button>
                    </form>
                @endif
                @if($donhang->dh_trangThai == 3)
                    <form class="d-inline" method="post" action="{{ route('backend.donhang.dagiao', ['id' => $donhang->dh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-success">Đã giao hàng</button>
                    </form>
                    <form class="d-inline" method="post" action="{{ route('backend.donhang.doi', ['id' => $donhang->dh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-warning">Đổi</button>
                    </form>
                    <form class="d-inline" method="post" action="{{ route('backend.donhang.tra', ['id' => $donhang->dh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-warning">Trả</button>
                    </form>
                    <form class="d-inline" method="post" action="{{ route('backend.donhang.huy', ['id' => $donhang->dh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-danger">Hủy đơn</button>
                    </form>
                @endif
                @if($donhang->dh_trangThai == 4)
                <a class="btn btn">Hoàn thành&#9989;</a>   
                @endif
                @if($donhang->dh_trangThai == 5)
                <form class="d-inline" method="post" action="{{ route('backend.donhang.doi1', ['id' => $donhang->dh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-warning">Đổi</button>
                </form>
                @endif
                @if($donhang->dh_trangThai == 6)
                <a class="btn btn">Đã hủy&#9940;</a>
                @endif
                @if($donhang->dh_trangThai == 7)
                <a class="btn btn">Trả hàng&#128148;</a>
                @endif
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
{{ $danhsachdonhang->links() }}
@endsection
