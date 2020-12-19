{{-- View này sẽ kế thừa giao diện từ `frontend.layouts.master` --}}
@extends('frontend.layouts.master')

{{-- Thay thế nội dung vào Placeholder `title` của view `frontend.layouts.master` --}}
@section('title')
Shop Hoa tươi - Sunshine
@endsection

{{-- Thay thế nội dung vào Placeholder `custom-css` của view `frontend.layouts.master` --}}
@section('custom-css')
@endsection

{{-- Thay thế nội dung vào Placeholder `main-content` của view `frontend.layouts.master` --}}
@section('main-content')


<!-- Slider -->
@include('frontend.widgets.homepage-slider')
<!-- Banner -->

<!-- Product -->
@include('frontend.widgets.product-search', [$data = $product])
@endsection

{{-- Thay thế nội dung vào Placeholder `custom-scripts` của view `frontend.layouts.master` --}}
@section('custom-scripts')
@endsection