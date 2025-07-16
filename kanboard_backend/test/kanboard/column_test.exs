defmodule Kanboard.ColumnTest do
  use Kanboard.DataCase

  alias Kanboard.Column

  describe "columns" do
    alias Kanboard.Column.TaskColumn

    import Kanboard.ColumnFixtures

    @invalid_attrs %{column_title: nil}

    test "list_columns/0 returns all columns" do
      task_column = task_column_fixture()
      assert Column.list_columns() == [task_column]
    end

    test "get_task_column!/1 returns the task_column with given id" do
      task_column = task_column_fixture()
      assert Column.get_task_column!(task_column.id) == task_column
    end

    test "create_task_column/1 with valid data creates a task_column" do
      valid_attrs = %{column_title: "some column_title"}

      assert {:ok, %TaskColumn{} = task_column} = Column.create_task_column(valid_attrs)
      assert task_column.column_title == "some column_title"
    end

    test "create_task_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Column.create_task_column(@invalid_attrs)
    end

    test "update_task_column/2 with valid data updates the task_column" do
      task_column = task_column_fixture()
      update_attrs = %{column_title: "some updated column_title"}

      assert {:ok, %TaskColumn{} = task_column} = Column.update_task_column(task_column, update_attrs)
      assert task_column.column_title == "some updated column_title"
    end

    test "update_task_column/2 with invalid data returns error changeset" do
      task_column = task_column_fixture()
      assert {:error, %Ecto.Changeset{}} = Column.update_task_column(task_column, @invalid_attrs)
      assert task_column == Column.get_task_column!(task_column.id)
    end

    test "delete_task_column/1 deletes the task_column" do
      task_column = task_column_fixture()
      assert {:ok, %TaskColumn{}} = Column.delete_task_column(task_column)
      assert_raise Ecto.NoResultsError, fn -> Column.get_task_column!(task_column.id) end
    end

    test "change_task_column/1 returns a task_column changeset" do
      task_column = task_column_fixture()
      assert %Ecto.Changeset{} = Column.change_task_column(task_column)
    end
  end
end
