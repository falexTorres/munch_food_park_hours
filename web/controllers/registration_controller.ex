defmodule SignMeIn.RegistrationController do
    use SignMeIn.Web, :controller
    alias SignMeIn.User

    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render(conn, changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
        changeset = User.changeset(%User{}, user_params)

        case SignMeIn.Registration.create(changeset, SignMeIn.Repo) do
            {:ok, changeset} -> 
                conn
                |> put_session(:current_user, changeset.id)
                |> put_flash(:info, "Your account was created successfully!")
                |> redirect(to: "/")
            {:error, changeset} ->
                conn
                |> put_flash(:error, "Unable to create account")
                |> render("new.html", changeset: changeset)
        end
    end
end
