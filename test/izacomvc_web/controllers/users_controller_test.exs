defmodule IzacomvcWeb.UsersControllerTest do
  @moduledoc false

  use IzacomvcWeb.ConnCase, async: true

  import Izacomvc.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "address" => "Rua Foo, Bar",
        "email" => "john@doe.com",
        "password" => "pwd",
        "name" => "John Doe"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua Foo, Bar",
                 "email" => "john@doe.com",
                 "id" => _id,
                 "name" => "John Doe",
                 "password" => "pwd"
               }
             } = response
    end

    test "when there are some error, return the error", %{conn: conn} do
      params = %{
        "password" => "pwd",
        "name" => "John Doe"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{"address" => ["can't be blank"], "email" => ["can't be blank"]}
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there are a user with the given id, deletes the user", %{conn: conn} do
      id = "ec753ba6-2816-4c6e-82c5-43736ac2703f"

      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
