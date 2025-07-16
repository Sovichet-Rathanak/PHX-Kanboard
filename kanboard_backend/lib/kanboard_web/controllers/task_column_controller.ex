defmodule KanboardWeb.TaskColumnController do
  use KanboardWeb, :controller

  import Ecto
  alias Kanboard.Repo
  alias Kanboard.Column
  alias Kanboard.Column.TaskColumn

  action_fallback(KanboardWeb.FallbackController)

  def index(conn, _params) do
    columns = Repo.all(TaskColumn) |> Repo.preload(:tasks)
    json(conn, Enum.map(columns, &data/1))
  end

  def create(conn, %{"task_column" => task_column_params}) do
    with {:ok, %TaskColumn{} = task_column} <- Column.create_task_column(task_column_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/columns/#{task_column}")
      |> render(:show, task_column: task_column)
    end
  end

  def show(conn, %{"id" => id}) do
    task_column = Repo.get!(TaskColumn, id) |> Repo.preload(:tasks)
    json(conn, data(task_column))
  end

  defp data(%TaskColumn{} = task_column) do
    base_data = %{
      id: task_column.id,
      column_title: task_column.column_title,
    }

    if assoc_loaded?(task_column.tasks) do
      Map.put(base_data, :tasks, task_column.tasks)
    else
      base_data
    end
  end

  def update(conn, %{"id" => id, "task_column" => task_column_params}) do
    task_column = Column.get_task_column!(id)

    with {:ok, %TaskColumn{} = task_column} <-
           Column.update_task_column(task_column, task_column_params) do
      render(conn, :show, task_column: task_column)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_column = Column.get_task_column!(id)

    with {:ok, %TaskColumn{}} <- Column.delete_task_column(task_column) do
      send_resp(conn, :no_content, "")
    end
  end
end
