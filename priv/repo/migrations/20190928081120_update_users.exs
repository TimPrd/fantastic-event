defmodule Happyevent.Repo.Migrations.UpdateUsers do
  use Ecto.Migration

  def change do
    rename table(:users), :name, to: :username
    alter table(:users) do
        add :encrypted_password, :string # Database type
    end
  end
end
