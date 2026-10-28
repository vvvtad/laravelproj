<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('membership_levels', function (Blueprint $table) {
            $table->id();
            $table->foreignId('membership_category_id')->constrained()->cascadeOnDelete();
            $table->string('name');
            $table->decimal('fee', 10, 2)->default(0);
            $table->integer('validity_days')->default(365);
            $table->text('benefits')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('membership_levels');
    }
};
