defmodule Izacomvc.Users.Delete do
  @moduledoc false

  alias Izacomvc.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
