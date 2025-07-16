defmodule Kanboard.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kanboard.Todos` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        due_date: ~N[2025-07-15 03:14:00],
        task_title: "some task_title"
      })
      |> Kanboard.Todos.create_task()

    task
  end
end
