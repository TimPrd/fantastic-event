defmodule Happyevent.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Happyevent.Accounts.{User, Encryption}
  alias Happyevent.UserEvent


  schema "users" do
    field :email, :string
    field :username, :string
    field :phone_number, :string
    field :encrypted_password, :string
    
    # VIRTUAL FIELDS
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    #many_to_many :events, Happyevent.Events.Event, join_through: "users_events"
    has_many :users_events, UserEvent, on_delete: :delete_all
    has_many :events, through: [:users_events, :event]

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username])
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> validate_format(:username, ~r/^[a-z0-9][a-z0-9]+[a-z0-9]$/i)
    |> validate_length(:username, min: 3)
    |> unique_constraint(:username)
    |> downcase_username
    |> encrypt_password
  end

  defp encrypt_password(changeset) do
    password = get_change(changeset, :password)
    if password do
      encrypted_password = Encryption.hash_password(password)
      put_change(changeset, :encrypted_password, encrypted_password)
    else
      changeset
    end
  end

  defp downcase_username(changeset) do
    update_change(changeset, :username, &String.downcase/1)
  end

end
