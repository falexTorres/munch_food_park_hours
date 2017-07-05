defmodule MunchHours.RegistrationController do
    use MunchHours.Web, :controller
    alias MunchHours.User

    def new(conn, _params) do
        user = current_user(conn)
        changeset = User.changeset(user)
        render(conn, changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
        user = current_user(conn)
        changeset = User.changeset(user, user_params)

        case MunchHours.Registration.create(changeset, MunchHours.Repo) do
            {:ok, changeset} -> 
                conn
                |> put_session(:current_user, changeset.id)
                |> put_flash(:info, "Your login info was changed successfully!")
                |> redirect(to: "/users/edit")
            {:error, changeset} ->
                conn
                |> render("new.html", changeset: changeset)
        end
    end
end
