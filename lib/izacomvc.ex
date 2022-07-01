defmodule Izacomvc do
  @moduledoc false

  alias Izacomvc.Products.Create, as: ProductCreate

  alias Izacomvc.Orders.Create, as: OrderCreate

  alias Izacomvc.Users.Create, as: UserCreate
  alias Izacomvc.Users.Delete, as: UserDelete
  alias Izacomvc.Users.Get, as: UserGet
  alias Izacomvc.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_product(params), to: ProductCreate, as: :call

  defdelegate create_order(params), to: OrderCreate, as: :call
end
