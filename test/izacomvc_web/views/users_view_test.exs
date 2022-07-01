defmodule IzacomvcWeb.UsersViewTest do
  @moduledoc false

  use IzacomvcWeb.ConnCase, async: true

  import Phoenix.View
  import Izacomvc.Factory

  alias IzacomvcWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Izacomvc.User{
               address: "Rua Foo, Bar",
               email: "john@doe.com",
               id: "ec753ba6-2816-4c6e-82c5-43736ac2703f",
               inserted_at: nil,
               name: "John Doe",
               password: "pwd",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
