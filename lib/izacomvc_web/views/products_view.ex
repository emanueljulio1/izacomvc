defmodule IzacomvcWeb.ProductsView do
  use IzacomvcWeb, :view
  alias Izacomvc.Product

  def render("create.json", %{product: %Product{} = product}) do
    %{
      message: "Product created!",
      product: product
    }
  end
end
