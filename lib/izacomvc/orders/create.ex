defmodule Izacomvc.Orders.Create do
  @moduledoc false
  import Ecto.Query

  alias Izacomvc.{Error, Order, Product, Repo}

  def call(params) do
    params
    |> fetch_products()
    |> handle_products(params)
  end

  defp fetch_products(%{"products" => products_params}) do
    products_ids = Enum.map(products_params, fn product -> product["id"] end)
    query = from product in Product, where: product.id in ^products_ids

    query
    |> Repo.all()
    |> validate_and_multiply_products(products_ids, products_params)
  end

  defp validate_and_multiply_products(products, products_ids, products_params) do
    products_map = Map.new(products, fn product -> {product.id, product} end)

    products_ids
    |> Enum.map(fn id -> {id, Map.get(products_map, id)} end)
    |> Enum.any?(fn {_id, value} -> is_nil(value) end)
    |> multiply_products(products_map, products_params)
  end

  defp multiply_products(true, _products, _products_params), do: {:error, "Invalid ids"}

  defp multiply_products(false, products, products_params) do
    products =
      Enum.reduce(products_params, [], fn %{"id" => id, "quantity" => quantity}, acc ->
        product = Map.get(products, id)
        acc ++ List.duplicate(product, quantity)
      end)

    {:ok, products}
  end

  defp handle_products({:error, result}, _params), do: {:error, Error.build(:bad_request, result)}

  defp handle_products({:ok, products}, params) do
    params
    |> Order.changeset(products)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Order{}} = order), do: order
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
