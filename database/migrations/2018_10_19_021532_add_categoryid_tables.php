<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddCategoryidTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('blogs', function (Blueprint $table) {
            $table->integer('category_id')->unsigned()->nullable();
            //foreign key
            $table->foreign('category_id')->references('id')->on('categories');
        });
        Schema::table('casestudies', function (Blueprint $table) {
            $table->integer('category_id')->unsigned()->nullable();
            //foreign key
            $table->foreign('category_id')->references('id')->on('categories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('blogs', function (Blueprint $table) {
            $table->dropColumn('category_id');
        });
        Schema::table('casestudies', function (Blueprint $table) {
            $table->dropColumn('category_id');
        });
    }
}
