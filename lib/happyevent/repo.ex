defmodule Happyevent.Repo do
  use Ecto.Repo,
    otp_app: :happyevent,
    adapter: Ecto.Adapters.Postgres
end
