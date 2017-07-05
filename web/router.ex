defmodule MunchHours.Router do
  use MunchHours.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug MunchHours.Plug.Authenticate
  end

  scope "/users", MunchHours do
    pipe_through [:browser, :authenticated]
    get "/edit", TruckController, :edit
    post "/edit", TruckController, :update
    resources "/changecredentials", RegistrationController, only: [:new, :create]
  end

  scope "/", MunchHours do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end



  # Other scopes may use custom stacks.
  # scope "/api", MunchHours do
  #   pipe_through :api
  # end
end
