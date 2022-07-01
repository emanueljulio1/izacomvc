defmodule IzacomvcWeb.WelcomeController do
  use IzacomvcWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome :)")
  end
end
