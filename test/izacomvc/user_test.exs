defmodule Izacomvc.UserTest do
  @moduledoc false

  use Izacomvc.DataCase, async: true

  import Izacomvc.Factory

  alias Ecto.Changeset
  alias Izacomvc.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "John Doe"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      update_params = %{name: "John Doe", password: "pwd"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "John Doe"}, valid?: true} = response
    end

    test "when there are some error, returns a invalid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      expected_response = %{}

      assert errors_on(response) == expected_response
    end
  end
end
