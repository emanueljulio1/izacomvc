defmodule Izacomvc.Repo.Migrations.CreateOrdersProductsTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:orders_products, primary_key: false) do
      add :product_id, references(:products, type: :binary_id)
      add :order_id, references(:orders, type: :binary_id)
    end
  end
end
