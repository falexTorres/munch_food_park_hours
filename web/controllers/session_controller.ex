defmodule SignMeIn.SessionController do
    use SignMeIn.Web, :controller
    
    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => session_params}) do
        case SignMeIn.Session.login(session_params, SignMeIn.Repo) do
            {:ok, user} ->
                conn
                |> put_session(:current_user, user.id)
                |> put_flash(:info, "logged in successfully!")
                |> redirect(to: "/")
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
        |> redirect(to: "/")
    end
end
