{{-- View này sẽ kế thừa giao diện từ `frontend.layouts.master` --}}
@extends('frontend.layouts.master')

{{-- Thay thế nội dung vào Placeholder `title` của view `frontend.layouts.master` --}}
@section('title')
Giới thiệu Shop Hoa tươi - F-shop
@endsection

{{-- Thay thế nội dung vào Placeholder `custom-css` của view `frontend.layouts.master` --}}
@section('custom-css')
@endsection

{{-- Thay thế nội dung vào Placeholder `main-content` của view `frontend.layouts.master` --}}
@section('main-content')
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('{{ asset('themes/cozastore/images/background2.jpg') }}');">
    <h2 class="ltext-105 cl0 txt-center">
        About
    </h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
    <div class="container">
        <div class="row p-b-148">
            <div class="col-md-7 col-lg-8">
                <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
                    <h3 class="mtext-111 cl2 p-b-16">
                        Mua sắm online
                    </h3>

                    <p class="stext-113 cl6 p-b-26">
                    Ngày này trong nhịp sống hối hả của con người thì việc giành thời gian để ra ngoài để mua sắm trở nên là 1 điều quá xa sỉ.. 
                    Những lo lắng về giao thông không an toàn và hạn chế trong việc mua hàng truyền thống có thể tránh được trong khi mua sắm trực tuyến. 
                    Với mua sắm trực tuyến(online), bạn cũng không cần phải lo lắng về điều kiện thời tiết. 
                    Người tiêu dùng và các khách hàng là những tổ chức, công ty,… đang dần chuyển sang mua sắm trực tuyến nhiều hơn nhằm tiết kiệm thời gian

                    
                    </p>

                    <p class="stext-113 cl6 p-b-26">
                    Chính vì thế việc mua sắm online càng trở nên quan trọng và cần thiết,chỉ cần 1 cú click chuột thì họ có thể có được sản phẩm mà mình mong muốn.
                    Việc mua sắm online có nhiều ưu điểm là có thể sở hữu mọi thứ thông qua các cú click chuột chứ không cần phải đến tận nơi để mua hàng. 
                    Sau khi vào website bán hàng, chọn sản phẩm, chỉ cần đặt hàng (order) người bán sẽ mang sản phẩm đến tận nhà bạn. 
                    Mua sắm online cho phép mua hàng bất cứ khi nào bạn muốn. Các cửa hang trên mạng không bao giờ đóng cửa, có thể mua sắm 24/24 giờ và 7 ngày trong tuần. 
                    Mua sắm ở các chợ, trung tâm thương mại hay cửa hàng rất khó để bạn có thể so sánh đặc điểm và giá của sản phẩm với nhau. 
                    Khi mua hàng online, bạn dễ dàng so sánh và đưa ra lựa chọn sản phẩm phù hợp nhất. Đôi khi bạn gặp phải những người bán hàng khó tính tại một số địa điểm bán hàng. 
                    Mua sắm online thì khách hàng chẳng phải để ý đến chuyện ấy nữa.
                    </p>

                    <p class="stext-113 cl6 p-b-26">
                        
                    </p>
                </div>
            </div>

            <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
                <div class="how-bor1 ">
                    <div class="hov-img0">
                        <img src="{{ asset('themes/cozastore/images/card_online.jpg') }}" alt="IMG">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

{{-- Thay thế nội dung vào Placeholder `custom-scripts` của view `frontend.layouts.master` --}}
@section('custom-scripts')
@endsection