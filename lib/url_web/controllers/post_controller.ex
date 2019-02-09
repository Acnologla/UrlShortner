import Ecto.Query

defmodule UrlWeb.PostController do
    use UrlWeb, :controller
    alias Url.{Repo, Url}
    def string_of_length(length) do
        chars =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789" |> String.split("")
       Enum.reduce((1..length), [], fn (_i, acc) ->
         [Enum.random(chars) | acc]
       end) |> Enum.join("")
     end
    def gen() do 
    code = string_of_length(6)
    u2 = Repo.one(from u in Url, where: u.code == ^code)
    if u2 == nil do 
    code
    else
    self().gen()
    end
    end
    def post(conn,%{"url" => url}) do 
        code = gen()
        changeset = Url.changeset(%Url{}, %{
            url: url,
            code: code
        })
        if (length(changeset.errors) == 0) do 
            u3 = Repo.one(from u in Url, where: u.url == ^url)
            if u3 == nil do 
            Repo.insert(%Url{ 
               code: code,
               url: url
               })
               json(conn, %{
                      url: "localhost:4000/#{code}"
                })
            else
                json(conn, %{
                    url: "localhost:4000/#{u3.code}"
              })
            end
        else
        json(conn,nil)
        end
    
end
  end
  