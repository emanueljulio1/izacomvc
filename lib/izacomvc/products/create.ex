defmodule Izacomvc.Products.Create do
  @moduledoc false

  alias Izacomvc.{Error, Product, Repo}

  def call(params) do
    params
    |> Product.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Product{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
