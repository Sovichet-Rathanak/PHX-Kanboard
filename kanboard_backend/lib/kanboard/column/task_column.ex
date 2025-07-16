defmodule Kanboard.Column.TaskColumn do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :column_title, :tasks]}
  schema "columns" do
    field :column_title, :string
    has_many :tasks, Kanboard.Todos.Task, foreign_key: :column_id
    timestamps()
  end

  @doc false
  def changeset(task_column, attrs) do
    task_column
    |> cast(attrs, [:column_title])
    |> validate_required([:column_title])
  end
end
