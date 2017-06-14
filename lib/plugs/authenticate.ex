defmodule SignMeIn.Plug.Authenticate do
    import Plug.Conn
    import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
    alias SignMeIn.Session

    def init(default), do: default

    def call(conn, _opts) do
	logged_in = Session.logged_in?(conn)
        if logged_in do
	    conn
	    |> put_flash(:info, "you are logged in")
        else
            conn
            |> put_flash(:error, "you are not logged in")
            |> redirect(to: "/login")
	    |> halt
        end
    end
end
