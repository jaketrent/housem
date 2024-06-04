defmodule Housem.Repo do
  use Ecto.Repo,
    otp_app: :housem,
    adapter: Ecto.Adapters.Postgres
end
