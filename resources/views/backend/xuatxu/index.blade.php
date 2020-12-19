@extends('backend.layout.master')

@section('title')
Danh sách xuất xứ
@endsection

@section('feature-title')
Danh sách xuất xứ
@endsection

@section('feature-description')
Danh sách các loại xuất xứ có trong Hệ thống. Bạn có thể CRUD!
@endsection

@section('content')
<a href="{{ route('backend.xuatxu.create') }}" class="btn btn-primary">Thêm mới xuất xứ</a>
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>STT</th>
            <th>Mã xuất xứ</th>
            <th>Tên xuất xứ</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $stt = 1;
        ?>
        @foreach($danhsachxuatxu as $xuatxu)
        <tr>
            <td>{{ $loop->index + 1 }}</td>
            <td>{{ $xuatxu->xx_ma }}</td>
            <td>{{ $xuatxu->xx_ten }}</td>
            <td>
                @if($xuatxu->xx_trangThai == 2)
                <a href="{{ route('backend.xuatxu.edit', ['id' => $xuatxu->xx_ma]) }}" class="btn btn-success">Sửa</a>
                <form class="d-inline" method="post" action="{{ route('backend.xuatxu.destroy', ['id' => $xuatxu->xx_ma]) }}">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="DELETE" />
                    <button class="btn btn-danger">Xóa</button>
                </form>
                @else
                <form class="d-inline" method="post" action="{{ route('backend.xuatxu.repose', ['id' => $xuatxu->xx_ma]) }}">
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
