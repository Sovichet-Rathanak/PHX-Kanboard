defmodule KanboardWeb.Router do
  use KanboardWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", KanboardWeb do
    pipe_through(:api)
    resources("/tasks", TaskController, except: [:new, :edit])
    resources("/columns", TaskColumnController, except: [:new, :edit])
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kanboard, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: KanboardWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
