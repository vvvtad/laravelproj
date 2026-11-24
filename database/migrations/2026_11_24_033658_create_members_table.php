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
        if (! Schema::hasTable('members')) {
            Schema::create('members', function (Blueprint $table) {
                $table->id();
                $table->string('membership_number')->unique();
                $table->string('first_name');
                $table->string('last_name');
                $table->string('email')->unique();
                $table->string('phone')->nullable();
                $table->text('address')->nullable();
                $table->foreignId('membership_category_id')->constrained()->cascadeOnDelete();
                $table->foreignId('membership_level_id')->constrained()->cascadeOnDelete();
                $table->date('starts_at')->nullable();
                $table->date('expires_at')->nullable();
                $table->enum('status', ['active', 'inactive', 'pending', 'deactivated'])->default('active');
                $table->timestamps();
            });

            return;
        }

        Schema::table('members', function (Blueprint $table) {
            $table->foreign('membership_category_id')
                ->references('id')
                ->on('membership_categories')
                ->cascadeOnDelete();
            $table->foreign('membership_level_id')
                ->references('id')
                ->on('membership_levels')
                ->cascadeOnDelete();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('members');
    }
};
