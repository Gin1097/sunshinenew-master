@extends('backend.layout.master')

@section('title')
Danh sách Sản phẩm
@endsection

@section('feature-title')
Danh sách Sản phẩm   
@endsection

@section('feature-description')
Danh sách các Sản phẩm có trong Hệ thống. Bạn có thể CRUD!
@endsection

@section('content')
@can('admin')
<a href="{{ route('backend.sanpham.create') }}" class="btn btn-primary">Thêm mới Sản phẩm</a>
<a href="{{ route('backend.sanpham.print') }}" class="btn btn-success" target="_blank">In danh sách Sản phẩm</a>
<a href="{{ route('backend.sanpham.pdf') }}" class="btn btn-danger" target="_blank">Xuất PDF Sản phẩm</a>
@endcan
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>STT</th>
            <th>Hình</th>
            <th>Mã sản phẩm</th>
            <th>Giá gốc</th>
            <th>Loại sản phẩm</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $stt = 1;
        ?>
        @foreach($danhsachsanpham as $sp)
        <tr>
            <td>{{ $loop->index + 1 }}</td>
            <td>
                <img src="{{ asset('storage/photos/' . $sp->sp_hinh) }}" class="sanpham-thumbnail" />
            </td>
            <td>{{ $sp->sp_ten }}</td>
            <td>{{ $sp->sp_giaGoc }}</td>
            <td>{{ $sp->loaisanpham->l_ten }}</td>
            <td>
                @can('giamdoc')
                    @if($sp->sp_trangThai == 2)

                    @endif
                @endcan
                @can('admin')
                @if($sp->sp_trangThai == 2)
                <a href="{{ route('backend.sanpham.edit', ['id' => $sp->sp_ma]) }}" class="btn btn-success">Sửa</a>
                <form class="d-inline" method="post" action="{{ route('backend.sanpham.destroy', ['id' => $sp->sp_ma]) }}">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="DELETE" />
                    <button class="btn btn-danger">Xóa</button>
                </form>
                @else
                <form class="d-inline" method="post" action="{{ route('backend.sanpham.repose', ['id' => $sp->sp_ma]) }}">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="PUT" />
                    <button class="btn btn-info">Đặt lại</button>
                </form>
                @endif
                @endcan
            </td>
        </tr>
        <?php
        $stt++;
        ?>
        @endforeach
    </tbody>
</table>
{{ $danhsachsanpham->links() }}
@endsection
