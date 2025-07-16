defmodule KanboardWeb.TaskJSON do
  alias Kanboard.Todos.Task

  @doc """
  Renders a list of tasks.
  """
  def index(%{tasks: tasks}) do
    %{data: for(task <- tasks, do: data(task))}
  end

  @doc """
  Renders a single task.
  """
  def show(%{task: task}) do
    %{data: data(task)}
  end

  defp data(%Task{} = task) do
    %{
      id: task.id,
      task_title: task.task_title,
      due_date: task.due_date,
      task_status: task.task_status
    }
  end
end
