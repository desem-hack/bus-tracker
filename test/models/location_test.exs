defmodule StandrewsBustracker.LocationTest do
  use StandrewsBustracker.ModelCase

  alias StandrewsBustracker.Location

  @valid_attrs %{lat: "some content", lng: "some content", timestamp: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
