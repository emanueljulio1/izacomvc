defmodule Izacomvc.Repo.Migrations.CreateUsersTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string
      add :email, :string
      add :password_hash, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:address])
  end
end
