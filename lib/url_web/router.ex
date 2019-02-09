defmodule UrlWeb.Router do
  use UrlWeb, :router

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

  scope "/", UrlWeb do
    pipe_through :browser
    
    get "/", PageController, :index
    get "/:code", PageController, :url
  scope "/" do 
    pipe_through :api
    post "/url", PostController, :post
  end
  end

  # Other scopes may use custom stacks.
  # scope "/api", UrlWeb do
  #   pipe_through :api
  # end
end
