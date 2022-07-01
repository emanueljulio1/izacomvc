defmodule Izacomvc.Repo do
  use Ecto.Repo,
    otp_app: :izacomvc,
    adapter: Ecto.Adapters.Postgres
end
