defmodule MunchHours.Registration do
    import Ecto.Changeset, only: [put_change: 3]

    def create(changeset, repo) do
        changeset
        |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
        |> put_change(:email, changeset.params["email"])
        |> repo.update()
    end

    def hashed_password(password) do
        Comeonin.Bcrypt.hashpwsalt(password)
    end
end
