defmodule Wh40ktoe.Repo do
  use Ecto.Repo,
    otp_app: :wh40ktoe,
    adapter: Ecto.Adapters.Postgres
end
