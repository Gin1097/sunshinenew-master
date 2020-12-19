@extends('backend.layout.master')

@section('title')
Danh sách khách hàng
@endsection

@section('feature-title')
Danh sách khách hàng
@endsection

@section('feature-description')
Danh sách khách hàng có trong Hệ thống. Bạn có thể CRUD!
@endsection

@section('content')
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>STT</th>
            <th>Tài khoản</th>
            <th>Tên khách hàng</th>
            <th>Email</th>
            <th>Giới tính</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $stt = 1;
        ?>
        @foreach($danhsachkhachhang as $kh)
        <tr>
            <td>{{ $loop->index + 1 }}</td>
            <td>{{ $kh->kh_taiKhoan }}</td>
            <td>{{ $kh->kh_hoTen }}</td>
            <td>{{ $kh->kh_email }}</td>
            <td>{{ $kh->kh_gioiTinh }}</td>
            <td>
                @if($kh->kh_trangThai == 2)
                    <a href="{{ route('backend.khachhang.edit', ['id' => $kh->kh_ma]) }}" class="btn btn-success">Sửa</a>
                    <form class="d-inline" method="post" action="{{ route('backend.khachhang.destroy', ['id' => $kh->kh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="DELETE" />
                        <button class="btn btn-danger">Xóa</button>
                    </form>
                @else
                    <form class="d-inline" method="post" action="{{ route('backend.khachhang.repose', ['id' => $kh->kh_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-info">Đặt lại</button>
                    </form>
                @endif
            </td>
        </tr>
        <?php
        $stt++;
        ?>
        @endforeach
    </tbody>
</table>
@endsection
