defmodule MunchHours.PageController do
  use MunchHours.Web, :controller
  alias MunchHours.Repo
  alias MunchHours.User

  plug :put_layout, "bare.html"

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
