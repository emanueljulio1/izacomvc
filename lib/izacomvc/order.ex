defmodule Izacomvc.Order do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Enum
  alias Izacomvc.{Product, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:address, :payment_method, :user_id]
  @payment_methods [:money, :credit_card, :debit_card]
  @derive {Jason.Encoder, only: @required_params ++ [:id, :products]}

  schema "orders" do
    field :address, :string
    field :payment_method, Enum, values: @payment_methods

    many_to_many :products, Product, join_through: "orders_products"
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, products) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:products, products)
    |> validate_length(:address, min: 3)
  end
end
