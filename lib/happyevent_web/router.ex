defmodule HappyeventWeb.Router do
  use HappyeventWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  
  # Guest
  scope "/", HappyeventWeb do
    pipe_through [:browser, HappyeventWeb.Plugs.Guest]
    # * User
    resources "/register", UserController, only: [:create, :new]
    get "/login", SessionController, :new
    post "/login", SessionController, :create    
  end

  # Auth
  scope "/", HappyeventWeb do
    pipe_through [:browser, HappyeventWeb.Plugs.Auth]
    # * User
    delete "/logout", SessionController, :delete
    get "/", HelloController, :index
    
    resources "/events", EventController
  end

  # resources "/events", EventController

  # Other scopes may use custom stacks.
  # scope "/api", HappyeventWeb do
  #   pipe_through :api
  # end
end
