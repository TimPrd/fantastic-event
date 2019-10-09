defmodule Happyevent.Repo.Migrations.UpdateUsersEventsPrimary do
  use Ecto.Migration

  def change do
    alter table(:users_events) do
      add :has_confirm, :boolean
    end
  end
end
