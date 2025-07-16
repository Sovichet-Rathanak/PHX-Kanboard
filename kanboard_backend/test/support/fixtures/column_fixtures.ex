defmodule Kanboard.ColumnFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kanboard.Column` context.
  """

  @doc """
  Generate a task_column.
  """
  def task_column_fixture(attrs \\ %{}) do
    {:ok, task_column} =
      attrs
      |> Enum.into(%{
        column_title: "some column_title"
      })
      |> Kanboard.Column.create_task_column()

    task_column
  end
end
