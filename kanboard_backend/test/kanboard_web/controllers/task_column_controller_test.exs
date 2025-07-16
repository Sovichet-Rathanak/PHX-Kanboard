defmodule KanboardWeb.TaskColumnControllerTest do
  use KanboardWeb.ConnCase

  import Kanboard.ColumnFixtures

  alias Kanboard.Column.TaskColumn

  @create_attrs %{
    column_title: "some column_title"
  }
  @update_attrs %{
    column_title: "some updated column_title"
  }
  @invalid_attrs %{column_title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all columns", %{conn: conn} do
      conn = get(conn, ~p"/api/columns")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task_column" do
    test "renders task_column when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/columns", task_column: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/columns/#{id}")

      assert %{
               "id" => ^id,
               "column_title" => "some column_title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/columns", task_column: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task_column" do
    setup [:create_task_column]

    test "renders task_column when data is valid", %{conn: conn, task_column: %TaskColumn{id: id} = task_column} do
      conn = put(conn, ~p"/api/columns/#{task_column}", task_column: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/columns/#{id}")

      assert %{
               "id" => ^id,
               "column_title" => "some updated column_title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task_column: task_column} do
      conn = put(conn, ~p"/api/columns/#{task_column}", task_column: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task_column" do
    setup [:create_task_column]

    test "deletes chosen task_column", %{conn: conn, task_column: task_column} do
      conn = delete(conn, ~p"/api/columns/#{task_column}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/columns/#{task_column}")
      end
    end
  end

  defp create_task_column(_) do
    task_column = task_column_fixture()
    %{task_column: task_column}
  end
end
