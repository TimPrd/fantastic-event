defmodule Happyevent.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :string
      add :lat, :float
      add :long, :float
      add :is_private, :boolean, default: false, null: false
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:owner_id])
  end
end
