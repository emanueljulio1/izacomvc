defmodule IzacomvcWeb.UsersController do
  @moduledoc false

  use IzacomvcWeb, :controller

  alias Izacomvc.User
  alias IzacomvcWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Izacomvc.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Izacomvc.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Izacomvc.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Izacomvc.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
