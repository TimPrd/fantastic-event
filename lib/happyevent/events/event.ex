defmodule Happyevent.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Happyevent.UserEvent

  schema "events" do
    field :description, :string
    field :is_private, :boolean, default: false
    field :lat, :float
    field :long, :float
    field :title, :string
    field :owner_id, :id
    #many_to_many :users, Happyevent.Accounts.User, join_through: "users_events"
    has_many :users_events, UserEvent, on_delete: :delete_all
    has_many :users, through: [:users_events, :user]
    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :lat, :long, :is_private])
    |> validate_required([:title, :description, :lat, :long, :is_private])
  end


  def changeset_update_users(event, users) do
    event
    |> cast(%{}, @required_fields)
    # associate projects to the user
    |> put_assoc(:users, users)
  end


end
