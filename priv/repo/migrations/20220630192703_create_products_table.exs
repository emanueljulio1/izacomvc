defmodule Izacomvc.Repo.Migrations.CreateProductsTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :decimal
      add :photo, :string

      timestamps()
    end
  end
end
