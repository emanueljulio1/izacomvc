defmodule IzacomvcWeb.ProductsController do
  @moduledoc false

  use IzacomvcWeb, :controller

  alias Izacomvc.Product
  alias IzacomvcWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Product{} = product} <- Izacomvc.create_product(params) do
      conn
      |> put_status(:created)
      |> render("create.json", product: product)
    end
  end
end
