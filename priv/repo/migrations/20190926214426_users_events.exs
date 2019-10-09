defmodule Happyevent.Repo.Migrations.UsersEvents do
  use Ecto.Migration

  def change do
    create table(:users_events) do
      add :user_id, references(:users)
      add :event_id, references(:events)
    end
  end
end
