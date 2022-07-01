defmodule Izacomvc.Repo.Migrations.CreateOrdersTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:orders) do
      add :address, :string
      add :payment_method, :payment_method
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
