@extends('backend.layout.master')

@section('title')
Danh sách hóa đơn sỉ
@endsection

@section('feature-title')
Danh sách hóa đơn sỉ
@endsection

@section('feature-description')
Danh sách hóa đơn sỉ có trong Hệ thống. Bạn có thể CRUD!
@endsection

@section('content')
@can('ketoan')
<a href="{{ route('backend.hoadonsi.create') }}" class="btn btn-primary">Thêm mới hóa đơn sỉ </a>
@endcan
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>STT</th>
            <th>Mã hóa đơn sỉ</th>
            <th>Tên người mua hàng</th>
            <th>Tên đơn vị</th>
            <th>Đơn hàng</th>
            <th>Thanh toán</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $stt = 1;
        ?>
        @foreach($danhsachhoadonsi as $hoadonsi)
        <tr>
            <td>{{ $loop->index + 1 }}</td>
            <td>{{ $hoadonsi->hds_ma }}</td>
            <td>{{ $hoadonsi->hds_nguoiMuaHang }}</td>
            <td>{{ $hoadonsi->hds_tenDonVi }}</td>
            <td>{{ $hoadonsi->dh_ma }}</td>
            <td>{{ $hoadonsi->thanhtoanhoadonsi->tt_ten }}</td>
            <td>
                @can('giamdoc')
                    @if($hoadonsi->hds_trangThai == 2)
                        @if($hoadonsi->nv_thuTruong == 1)
                        <form class="d-inline" method="post" action="{{ route('backend.hoadonsi.confirm', ['id' => $hoadonsi->hds_ma]) }}">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="PUT" />
                        <button class="btn btn-info">Xác nhận</button>
                        </form>
                        @endif
                    @endif
                @endcan
                @can('ketoan')
                    @if($hoadonsi->hds_trangThai == 2)
                        @if($hoadonsi->nv_thuTruong == 1)
                        <a href="{{ route('backend.hoadonsi.edit', ['id' => $hoadonsi->hds_ma]) }}" class="btn btn-success">Sửa</a>
                        <form class="d-inline" method="post" action="{{ route('backend.hoadonsi.destroy', ['id' => $hoadonsi->hds_ma]) }}">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="DELETE" />
                            <button class="btn btn-danger">Xóa</button>
                        </form>
                        @else
                        <a href="{{ route('backend.hoadonsi.edit', ['id' => $hoadonsi->hds_ma]) }}" class="btn btn-success">Sửa</a>
                        <a href="{{ route('backend.hoadonsi.print', ['id' => $hoadonsi->hds_ma]) }}" class="btn btn-warning" target="_blank">In hd</a>
                        <form class="d-inline" method="post" action="{{ route('backend.hoadonsi.destroy', ['id' => $hoadonsi->hds_ma]) }}">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="DELETE" />
                            <button class="btn btn-danger">Xóa</button>
                        </form>
                        @endif
                    @else
                        <form class="d-inline" method="post" action="{{ route('backend.hoadonsi.repose', ['id' => $hoadonsi->hds_ma]) }}">
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
{{ $danhsachhoadonsi->links() }}
@endsection
