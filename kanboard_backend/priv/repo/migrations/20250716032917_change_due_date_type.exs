defmodule Kanboard.Repo.Migrations.ChangeDueDateType do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE tasks ALTER COLUMN due_date TYPE date USING due_date::date")
  end

  def down do
    execute("ALTER TABLE tasks ALTER COLUMN due_date TYPE timestamp USING due_date::timestamp")
  end
end
