<div class="sec-banner bg0 p-t-80 p-b-50">
    <div class="container">
        <div class="row isotope-grid">
            @foreach($data as $index=>$item)
            <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item loai-{{ $item->l_ma }}">
                <!-- Block2 -->
                <div class="block2">
                    <div class="block2-pic hov-img0">
                        <img src="{{ asset('storage/photos/' . $item->sp_hinh) }}" alt="IMG-PRODUCT">

                        <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal" data-sp-ma="{{ $item->sp_ma }}">
                            Xem nhanh
                        </a>
                    </div>

                    <div class="block1-txt-child1 flex-col-l"><span class="block1-name ltext-102 trans-04 p-b-8">{{ $item->l_ten }}</span>
                        <span class="block1-info stext-102 trans-04">{{ $item->sp_ten }}</span>
                    </div>
                </div>

                <!-- Modal quick view -->
                @include('frontend.widgets.product-quick-view', ['sp' => $item, 'hinhanhlienquan' => $danhsachhinhanhlienquan])
            </div>
            @endforeach
        </div>
    </div>
</div>