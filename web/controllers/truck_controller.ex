defmodule MunchHours.TruckController do
  use MunchHours.Web, :controller
  alias MunchHours.User
  alias MunchHours.Repo
  alias Ecto.DateTime

  def edit(conn, _params) do
      user = current_user(conn)
      changeset = User.changeset_change_times(user)
      render(conn, "edit.html", user: user, changeset: changeset, todays_date: DateTime.from_erl(:erlang.localtime))
  end

  defp format_datetime(datetime) do
      datetime
      |> String.split("-")
      |> yyyy_mm_dd_To_mm_dd_yyyy()
  end

  defp yyyy_mm_dd_To_mm_dd_yyyy(before) do
      before[1] + "/" + before[2] + "/" + before[0]
  end

  def update(conn, %{"user" => user_params}) do
        user = current_user(conn)
        changeset = User.changeset_change_times(user, user_params)

        case Repo.update(changeset) do
            {:ok, user} -> 
                conn
                |> put_session(:current_user, user.id)
                |> put_flash(:info, "Truck info updated successfully!")
                |> render("edit.html", user: user, changeset: changeset, todays_date: DateTime.from_erl(:erlang.localtime))
            {:error, changeset} ->
                conn
                |> put_flash(:error, "Error saving truck Info")
                |> render("edit.html", user: user, changeset: changeset, todays_date: DateTime.from_erl(:erlang.localtime))
        end
  end

end