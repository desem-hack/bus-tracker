defmodule StandrewsBustracker.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :lat, :string
      add :lng, :string
      add :timestamp, :integer

      timestamps
    end

  end
end
