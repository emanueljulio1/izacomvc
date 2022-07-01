defmodule IzacomvcWeb.Router do
  use IzacomvcWeb, :router
  alias IzacomvcWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", IzacomvcWeb do
    pipe_through :api

    get "/", WelcomeController, :index
    resources "/users", UsersController, except: [:new, :edit]

    post "/products", ProductsController, :create
    post "/orders", OrdersController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: IzacomvcWeb.Telemetry
    end
  end
end
