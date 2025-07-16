defmodule KanboardWeb.TaskColumnController do
  use KanboardWeb, :controller

  alias Kanboard.Column
  alias Kanboard.Column.TaskColumn

  action_fallback KanboardWeb.FallbackController

  def index(conn, _params) do
    columns = Column.list_columns()
    render(conn, :index, columns: columns)
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
    task_column = Column.get_task_column!(id)
    render(conn, :show, task_column: task_column)
  end

  def update(conn, %{"id" => id, "task_column" => task_column_params}) do
    task_column = Column.get_task_column!(id)

    with {:ok, %TaskColumn{} = task_column} <- Column.update_task_column(task_column, task_column_params) do
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
