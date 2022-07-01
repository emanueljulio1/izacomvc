defmodule Izacomvc.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Izacomvc.Repo

  alias Izacomvc.User

  def user_params_factory do
    %{
      address: "Rua Foo, Bar",
      email: "john@doe.com",
      password: "pwd",
      name: "John Doe"
    }
  end

  def user_factory do
    %User{
      address: "Rua Foo, Bar",
      email: "john@doe.com",
      password: "pwd",
      name: "John Doe",
      id: "ec753ba6-2816-4c6e-82c5-43736ac2703f"
    }
  end
end
