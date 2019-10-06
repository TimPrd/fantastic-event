defmodule Happyevent.UserEvent do
    use Ecto.Schema
    import Ecto.Changeset
  
    @primary_key false
    schema "users_events" do
      belongs_to :user, Happyevent.Accounts.User
      belongs_to :event, Happyevent.Events.Event
    end
  
  end