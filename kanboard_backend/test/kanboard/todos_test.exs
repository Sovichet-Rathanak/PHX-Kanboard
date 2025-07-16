defmodule Kanboard.TodosTest do
  use Kanboard.DataCase

  alias Kanboard.Todos

  describe "tasks" do
    alias Kanboard.Todos.Task

    import Kanboard.TodosFixtures

    @invalid_attrs %{task_title: nil, due_date: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Todos.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Todos.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{task_title: "some task_title", due_date: ~N[2025-07-15 03:14:00]}

      assert {:ok, %Task{} = task} = Todos.create_task(valid_attrs)
      assert task.task_title == "some task_title"
      assert task.due_date == ~N[2025-07-15 03:14:00]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{task_title: "some updated task_title", due_date: ~N[2025-07-16 03:14:00]}

      assert {:ok, %Task{} = task} = Todos.update_task(task, update_attrs)
      assert task.task_title == "some updated task_title"
      assert task.due_date == ~N[2025-07-16 03:14:00]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_task(task, @invalid_attrs)
      assert task == Todos.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Todos.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Todos.change_task(task)
    end
  end
end
