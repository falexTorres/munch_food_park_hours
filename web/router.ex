defmodule SignMeIn.Router do
  use SignMeIn.Web, :router

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
    plug SignMeIn.Plug.Authenticate
  end

  scope "/admin", SignMeIn do
    pipe_through [:browser, :authenticated]
    get "/", PageController, :index
  end

  scope "/", SignMeIn do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
    resources "/registrations", RegistrationController, only: [:new, :create]
  end



  # Other scopes may use custom stacks.
  # scope "/api", SignMeIn do
  #   pipe_through :api
  # end
end
