defmodule Isolab.Repo do
  use Ecto.Repo,
    otp_app: :isolab,
    adapter: Ecto.Adapters.SQLite3
end
