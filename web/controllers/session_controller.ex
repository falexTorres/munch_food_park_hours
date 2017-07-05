defmodule MunchHours.SessionController do
    use MunchHours.Web, :controller
    
    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => session_params}) do
        case MunchHours.Session.login(session_params, MunchHours.Repo) do
            {:ok, user} ->
                conn
                |> put_session(:current_user, user.id)
                |> put_flash(:info, "logged in successfully!")
                |> redirect(to: "/users/edit")
            :error ->
                conn
                |> put_flash(:error, "invalid email/password combination")
                |> render("new.html")
        end
    end

    def delete(conn, _) do
        conn
        |> delete_session(:current_user)
        |> put_flash(:info, "logged out successfully!")
        |> redirect(to: "/login")
    end
end
