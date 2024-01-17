<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('instruments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('instrument_program_id');
            $table->foreign('instrument_program_id')->references('id')->on('programs')->onDelete('cascade');
            $table->string('name');
            $table->smallInteger('isLevel_1')->default(0);
            $table->smallInteger('isLevel_2')->default(0);
            $table->smallInteger('isLevel_3')->default(0);
            $table->smallInteger('isLevel_4')->default(0);
            $table->string('instrument_type');
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
        Schema::dropIfExists('instruments');
    }
};
