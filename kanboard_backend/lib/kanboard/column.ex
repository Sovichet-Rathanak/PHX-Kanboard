defmodule Kanboard.Column do
  @moduledoc """
  The Column context.
  """

  import Ecto.Query, warn: false
  alias Kanboard.Repo

  alias Kanboard.Column.TaskColumn

  @doc """
  Returns the list of columns.

  ## Examples

      iex> list_columns()
      [%TaskColumn{}, ...]

  """
  def list_columns do
    Repo.all(TaskColumn)
  end

  @doc """
  Gets a single task_column.

  Raises `Ecto.NoResultsError` if the Task column does not exist.

  ## Examples

      iex> get_task_column!(123)
      %TaskColumn{}

      iex> get_task_column!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_column!(id), do: Repo.get!(TaskColumn, id)

  @doc """
  Creates a task_column.

  ## Examples

      iex> create_task_column(%{field: value})
      {:ok, %TaskColumn{}}

      iex> create_task_column(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_column(attrs \\ %{}) do
    %TaskColumn{}
    |> TaskColumn.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_column.

  ## Examples

      iex> update_task_column(task_column, %{field: new_value})
      {:ok, %TaskColumn{}}

      iex> update_task_column(task_column, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_column(%TaskColumn{} = task_column, attrs) do
    task_column
    |> TaskColumn.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_column.

  ## Examples

      iex> delete_task_column(task_column)
      {:ok, %TaskColumn{}}

      iex> delete_task_column(task_column)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_column(%TaskColumn{} = task_column) do
    Repo.delete(task_column)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_column changes.

  ## Examples

      iex> change_task_column(task_column)
      %Ecto.Changeset{data: %TaskColumn{}}

  """
  def change_task_column(%TaskColumn{} = task_column, attrs \\ %{}) do
    TaskColumn.changeset(task_column, attrs)
  end
end
