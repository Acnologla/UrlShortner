defmodule Url.Url do
  use Ecto.Schema
  import Ecto.Changeset
  alias Url.Url


  schema "urls" do
    field :code, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%Url{} = url, attrs) do
    url
    |> cast(attrs, [:code, :url])
    |> validate_required([:code, :url])
    |> validate_format(:url, ~r/https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/)

  end
end
