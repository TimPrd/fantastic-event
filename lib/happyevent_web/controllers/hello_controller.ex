defmodule HappyeventWeb.HelloController do
    use HappyeventWeb, :controller
  
    def index(conn, _params) do
        conn
        |> put_flash(:info, "Wezlcome to Phoenix, from flash info!")
        |> render("index.html")
    end

    def show(conn, _params) do
        render(conn, "index.html")
    end

    def create(conn, _params) do
        render(conn, "index.html")
    end
  end
  