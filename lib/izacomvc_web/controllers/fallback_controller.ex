defmodule IzacomvcWeb.FallbackController do
  use IzacomvcWeb, :controller
  alias Izacomvc.Error
  alias IzacomvcWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
