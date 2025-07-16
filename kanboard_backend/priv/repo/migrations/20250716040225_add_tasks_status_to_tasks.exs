defmodule Kanboard.Repo.Migrations.AddTasksStatusToTasks do
  use Ecto.Migration

  def up do
    alter table(:tasks) do
      add(:task_status, :string, null: false, default: "medium")
    end
  end

  def down do
    alter table(:tasks) do
      remove(:task_status)
    end
  end
end
