defmodule Izacomvc.Users.CreateTest do
  @moduledoc false

  use Izacomvc.DataCase, async: true

  import Izacomvc.Factory

  alias Izacomvc.{Error, User}
  alias Izacomvc.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, password: "pwd"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{password: "pw"})

      response = Create.call(params)

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      expected_response = %{password: ["should be at least 3 character(s)"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
