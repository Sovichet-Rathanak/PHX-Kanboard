defmodule Kanboard.Repo.Migrations.AddColumnIdToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :column_id, references(:columns, on_delete: :delete_all) #Cascade delete
    end
  end
end
