defmodule Marko.Repo do
  use Ecto.Repo,
    otp_app: :marko,
    adapter: Ecto.Adapters.Postgres
end
