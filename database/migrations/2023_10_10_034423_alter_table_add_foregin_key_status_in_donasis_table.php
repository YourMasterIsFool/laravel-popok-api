<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {   
        Schema::table('donasis', function (Blueprint $table) {
            //
            // $table->dropForeign(['status_id']);
            // $table->dropColumn('status_id');

        });
        Schema::table('donasis', function (Blueprint $table) {
            //

            $table->unsignedBigInteger('status_id')->nullable();
            // $table->foreign('status_id')->references('code')->on('donasi_statuses')->onDelete('cascade');
         
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    { 
       
    }
};
