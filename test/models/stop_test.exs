defmodule StandrewsBustracker.StopTest do
  use StandrewsBustracker.ModelCase

  alias StandrewsBustracker.Stop

  @valid_attrs %{lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Stop.changeset(%Stop{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Stop.changeset(%Stop{}, @invalid_attrs)
    refute changeset.valid?
  end
end
