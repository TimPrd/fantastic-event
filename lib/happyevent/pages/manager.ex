defmodule Happyevent.Pages.Manager do
    def land_page?(conn) do
        Phoenix.Controller.current_path(conn) == "/"
    end
end