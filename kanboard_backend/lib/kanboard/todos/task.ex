defmodule Kanboard.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :task_title, :due_date, :task_status]}

  schema "tasks" do
    field :task_title, :string
    field :due_date, :date
    field :task_status, Ecto.Enum, values: [:high, :medium, :low], default: :medium
    belongs_to :columns, Kanboard.Column.TaskColumn, foreign_key: :column_id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:task_title, :due_date, :task_status, :column_id])
    |> validate_required([:task_title, :due_date, :column_id])
  end
end
