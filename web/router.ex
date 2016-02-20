defmodule StandrewsBustracker.Router do
  use StandrewsBustracker.Web, :router

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

  scope "/", StandrewsBustracker do
    pipe_through :browser # Use the default browser stack

    resources "/stops", StopController
    get "/", LocationController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", StandrewsBustracker do
    pipe_through :api

    post "/locations", LocationController, :create
    get "/bus", LocationController, :last
  end
end
