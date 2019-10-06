defmodule HappyeventWeb.PageController do
  use HappyeventWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
    
  end
end
