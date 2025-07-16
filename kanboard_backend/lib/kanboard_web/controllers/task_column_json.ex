defmodule KanboardWeb.TaskColumnJSON do
  alias Kanboard.Column.TaskColumn

  @doc """
  Renders a list of columns.
  """
  def index(%{columns: columns}) do
    %{data: for(task_column <- columns, do: data(task_column))}
  end

  @doc """
  Renders a single task_column.
  """
  def show(%{task_column: task_column}) do
    %{data: data(task_column)}
  end

  defp data(%TaskColumn{} = task_column) do
    %{
      id: task_column.id,
      column_title: task_column.column_title
    }
  end
end
