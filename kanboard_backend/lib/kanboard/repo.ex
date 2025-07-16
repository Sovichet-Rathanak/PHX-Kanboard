defmodule Kanboard.Repo do
  use Ecto.Repo,
    otp_app: :kanboard,
    adapter: Ecto.Adapters.Postgres
end
