defmodule Url.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :code, :string
      add :url, :string

      timestamps()
    end

  end
end
