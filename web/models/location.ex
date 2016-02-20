defmodule StandrewsBustracker.Location do
  use StandrewsBustracker.Web, :model

  schema "locations" do
    field :lat, :string
    field :lng, :string
    field :timestamp, :integer

    timestamps
  end

  @required_fields ~w(lat lng timestamp)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
