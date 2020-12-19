@extends('backend.layout.master')

@section('title')
Danh sách chi tiết nhập
@endsection

@section('feature-title')
Danh sách chi tiết nhập
@endsection

@section('feature-description')
Danh sách chi tiết nhập có trong Hệ thống. Bạn có thể CRUD!
@endsection

@section('content')
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>STT</th>
            <th>Mã phiếu</th>
            <th>Sản phẩm</th>
            <th>Màu</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $stt = 1;
        ?>
        @foreach($danhsachchitietnhap as $chitietnhap)
        <tr>
            <td>{{ $loop->index + 1 }}</td>
            <td>{{ $chitietnhap->pn_ma }}</td>
            <td>
            <?php $sanpham = DB::table('sanpham')->where('sp_ma', $chitietnhap->sp_ma)->first(); ?>
                @if(!empty($sanpham->sp_ten))
                {!! $sanpham->sp_ten !!}
                @else
                {!!NULL!!}
                @endif
            </td>
            <td>
            <?php $mau = DB::table('mau')->where('m_ma', $chitietnhap->m_ma)->first(); ?>
                @if(!empty($mau->m_ten))
                {!! $mau->m_ten !!}
                @else
                {!!NULL!!}
                @endif
            </td>
            <td>{{ $chitietnhap->ctn_soLuong }}</td>
            <td>{{ $chitietnhap->ctn_donGia }}</td>
            <td>
                <a href="{{ route('backend.chitietnhap.edit', ['id' => $chitietnhap->pn_ma, 'id1' => $chitietnhap->sp_ma, 'id2' => $chitietnhap->m_ma]) }}" class="btn btn-success">Sửa</a>
            </td>
        </tr>
        <?php
        $stt++;
        ?>
        @endforeach
    </tbody>
</table>
{{ $danhsachchitietnhap->links() }}
@endsection
