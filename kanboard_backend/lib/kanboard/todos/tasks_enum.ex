defmodule Kanboard.Todos.TasksEnum do
  @task_statuses [:high, :medium, :low]

  def task_statuses, do: @task_statuses

  def valid_task_status?(status) when status in @task_statuses, do: true
  def valid_task_statsu?(_), do: false
end
