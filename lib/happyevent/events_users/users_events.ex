defmodule Happyevent.UserEvent do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "users_events" do
      belongs_to :user, Happyevent.Accounts.User#, references: :user_id
      belongs_to :event, Happyevent.Events.Event#, references: :event_id
      field :is_admin, :boolean
      #field :confirmed, :bool
      # field :is_admin, :bool

    end
  
  end