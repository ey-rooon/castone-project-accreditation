<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('universities', function (Blueprint $table) {
            $table->id();
            $table->string('university_id')->unique();
            $table->string('name');
            $table->timestamps();
        });

        DB::table('universities')->insert(
            array(
                'id'=>null,
                'university_id'=>'psu',
                'name'=>'Pangasinan State University',
                'created_at'=> NOW(), 
                'updated_at'=> NOW(),
            ),
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('universities');
    }
};
