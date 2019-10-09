defmodule Happyevent.Repo.Migrations.UpdateUsersEvents do
  use Ecto.Migration

  def change do
    alter table(:users_events) do
      add :is_admin, :boolean
    end
  end
end
