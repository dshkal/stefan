<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBasicTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blogs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 1000);
            $table->text('content');
            $table->string('thumbnail');
            $table->timestamps();
        });
        Schema::create('casestudies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 1000);
            $table->text('content');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blogs');
        Schema::dropIfExists('casestudies');
    }
}
