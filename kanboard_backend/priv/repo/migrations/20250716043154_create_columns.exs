defmodule Kanboard.Repo.Migrations.CreateColumns do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :column_title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
