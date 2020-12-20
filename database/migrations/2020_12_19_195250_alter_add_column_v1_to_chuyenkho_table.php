<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterAddColumnV1ToChuyenkhoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('chuyenkho', function (Blueprint $table) {
            //
            $table->tinyInteger('ck_trangThai')->default('2')->comment('Trạng thái # Trạng thái phiếu chuyển sản phẩm: 1-khóa, 2-khả dụng');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('chuyenkho', function (Blueprint $table) {
            //
            $table->tinyInteger('ck_trangThai')->default('2')->comment('Trạng thái # Trạng thái phiếu chuyển sản phẩm: 1-khóa, 2-khả dụng');
        });
    }
}
