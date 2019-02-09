import Ecto.Query
defmodule UrlWeb.PageController do
  use UrlWeb, :controller
  alias Url.{Repo, Url}
  def index(conn, _params) do
    render(conn, "index.html")
  end
  def url(conn,%{"code" => code}) do
  u3 = Repo.one(from u in Url, where: u.code == ^code)
  if u3 == nil do 
  redirect(conn, to: "/")
  else
    redirect(conn, external: u3.url)
 end
  end
end
