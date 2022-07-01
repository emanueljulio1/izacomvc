defmodule Izacomvc.Product do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias Izacomvc.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :description, :price, :photo]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :photo, :string

    many_to_many :order, Order, join_through: "orders_products"

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_number(:price, greater_than: 0)
  end
end
