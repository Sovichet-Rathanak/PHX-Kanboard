defmodule Kanboard.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :task_title, :string
    field :due_date, :date
    field :task_status, Ecto.Enum, values: [:high, :medium, :low], default: :medium

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:task_title, :due_date, :task_status])
    |> validate_required([:task_title, :due_date])
  end
end
