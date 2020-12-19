<div class="bg0 m-t-23 p-b-140">
    <div class="container">
        <div class="flex-w flex-sb-m p-b-52">

            <div class="flex-w flex-c-m m-tb-10">
                <!-- <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                    <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                    <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Filter
                </div> -->

                <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                    <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                    <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Search
                </div>
            </div>

            <!-- Search product -->
            
            <div class="dis-none panel-search w-full p-t-10 p-b-15">
                <div class="bor8 dis-flex p-l-15">
                    <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                        <i class="zmdi zmdi-search"></i>
                    </button>
                <form role="search" method="get" id="formsearch" action="{{route('frontend.search')}}">
                    <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" placeholder="Tên sản phẩm ..." name ="key">
                    </form>
                </div>
            </div>
            
            <!-- Filter -->
            
        </div>

        <div class="row isotope-grid">
            @foreach($data as $index=>$str)
            <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item loai-{{ $str->l_ma }}">
                <!-- Block2 -->
                <div class="block2">
                    <div class="block2-pic hov-img0">
                        <img src="{{ asset('storage/photos/' . $str->sp_hinh) }}" alt="IMG-PRODUCT">

                        <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal" data-sp-ma="{{ $str->sp_ma }}">
                            Xem nhanh
                        </a>
                    </div>

                    <div class="block2-txt flex-w flex-t p-t-14">
                        <div class="block2-txt-child1 flex-col-l ">
                            <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                {{ $str->sp_ten }}
                            </a>

                            <span class="stext-105 cl3">
                                {{ $str->sp_giaBan }}
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Modal quick view -->
                @include('frontend.widgets.product-quick-view', ['sp' => $str, 'hinhanhlienquan' => $danhsachhinhanhlienquan])
            </div>
            @endforeach
        </div>

        <!-- Load more -->
        <div class="flex-c-m flex-w w-full p-t-45">
            <a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
                Load More
            </a>
        </div>
    </div>
</div>