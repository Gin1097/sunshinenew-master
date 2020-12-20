<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterAddColumnV1ToXuatkhoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('xuatkho', function (Blueprint $table) {
            $table->tinyInteger('xk_trangThai')->default('2')->comment('Trạng thái # Trạng thái phiếu xuất sản phẩm: 1-khóa, 2-khả dụng');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('xuatkho', function (Blueprint $table) {
            //
            $table->tinyInteger('xk_trangThai')->default('2')->comment('Trạng thái # Trạng thái phiếu xuất sản phẩm: 1-khóa, 2-khả dụng');
        });
    }
}
