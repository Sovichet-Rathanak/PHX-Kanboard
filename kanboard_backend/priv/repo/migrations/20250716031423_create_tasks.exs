defmodule Kanboard.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :task_title, :string
      add :due_date, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
