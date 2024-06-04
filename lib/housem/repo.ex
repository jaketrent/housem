defmodule Housem.Repo do
  use AshPostgres.Repo,
    otp_app: :housem

  def installed_extensions do
    ["ash-functions"]
  end
end
