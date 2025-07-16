defmodule Kanboard.Column.TaskColumn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "columns" do
    field :column_title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_column, attrs) do
    task_column
    |> cast(attrs, [:column_title])
    |> validate_required([:column_title])
  end
end
