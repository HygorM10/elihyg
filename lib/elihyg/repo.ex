defmodule Elihyg.Repo do
  use Ecto.Repo,
    otp_app: :elihyg,
    adapter: Ecto.Adapters.Postgres
end
