defmodule IzacomvcWeb.OrdersController do
  @moduledoc false

  use IzacomvcWeb, :controller

  alias Izacomvc.Order
  alias IzacomvcWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Izacomvc.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
