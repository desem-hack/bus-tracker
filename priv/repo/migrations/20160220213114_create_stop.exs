defmodule StandrewsBustracker.Repo.Migrations.CreateStop do
  use Ecto.Migration

  def change do
    create table(:stops) do
      add :name, :string
      add :lat, :float
      add :lng, :float

      timestamps
    end

  end
end
