defmodule IzacomvcWeb.OrdersView do
  use IzacomvcWeb, :view
  alias Izacomvc.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created!",
      order: order
    }
  end
end
