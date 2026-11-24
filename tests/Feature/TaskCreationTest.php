<?php

use App\Models\Task;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

test('a submitted task is saved and displayed in the task list', function () {
    $response = $this->post(route('tasks.store'), [
        'task_title' => 'Buy groceries',
        'description' => 'Milk and bread',
    ]);

    $response->assertRedirect(route('tasks.index'))
        ->assertSessionHas('success', 'Task created successfully.');

    $this->assertDatabaseHas('tasks', [
        'task_title' => 'Buy groceries',
        'description' => 'Milk and bread',
    ]);

    $this->get(route('tasks.index'))
        ->assertOk()
        ->assertSee('Buy groceries')
        ->assertSee('Milk and bread');
});

test('PATCH updates only the submitted task fields', function () {
    $task = Task::create([
        'task_title' => 'Old title',
        'description' => 'Old description',
    ]);

    $response = $this->patch(route('tasks.update', $task->id), [
        'task_title' => 'Updated title',
    ]);

    $response->assertRedirect(route('tasks.index'))
        ->assertSessionHas('success', 'Task updated successfully.');

    $this->assertDatabaseHas('tasks', [
        'id' => $task->id,
        'task_title' => 'Updated title',
        'description' => 'Old description',
    ]);
});

test('PATCH can clear the task description without changing its title', function () {
    $task = Task::create([
        'task_title' => 'Existing title',
        'description' => 'Existing description',
    ]);

    $response = $this->patch(route('tasks.update', $task->id), [
        'description' => null,
    ]);

    $response->assertRedirect(route('tasks.index'));

    $this->assertDatabaseHas('tasks', [
        'id' => $task->id,
        'task_title' => 'Existing title',
        'description' => null,
    ]);
});

test('the task edit form shows the existing values', function () {
    $task = Task::create([
        'task_title' => 'Existing title',
        'description' => 'Existing description',
    ]);

    $this->get(route('tasks.edit', $task->id))
        ->assertOk()
        ->assertSee('Existing title')
        ->assertSee('Existing description')
        ->assertSee(route('tasks.update', $task->id));
});

test('updating a task that does not exist returns not found', function () {
    $this->put(route('tasks.update', 999), [
        'task_title' => 'Updated title',
        'description' => 'Updated description',
    ])->assertNotFound();
});

test('the next task starts at id one after the last task is deleted', function () {
    $task = Task::create([
        'task_title' => 'Last task',
        'description' => null,
    ]);

    $this->delete(route('tasks.destroy', $task))
        ->assertRedirect(route('tasks.index'));

    $this->post(route('tasks.store'), [
        'task_title' => 'First task again',
        'description' => null,
    ])->assertRedirect(route('tasks.index'));

    $this->assertDatabaseHas('tasks', [
        'id' => 1,
        'task_title' => 'First task again',
    ]);
});

test('deleting a task does not reset the id while other tasks remain', function () {
    $firstTask = Task::create([
        'task_title' => 'First task',
        'description' => null,
    ]);
    $secondTask = Task::create([
        'task_title' => 'Second task',
        'description' => null,
    ]);

    $this->delete(route('tasks.destroy', $secondTask))
        ->assertRedirect(route('tasks.index'));

    $this->post(route('tasks.store'), [
        'task_title' => 'Third task',
        'description' => null,
    ])->assertRedirect(route('tasks.index'));

    $this->assertDatabaseHas('tasks', [
        'id' => $firstTask->id,
        'task_title' => 'First task',
    ]);
    $this->assertDatabaseHas('tasks', [
        'id' => 3,
        'task_title' => 'Third task',
    ]);
});
