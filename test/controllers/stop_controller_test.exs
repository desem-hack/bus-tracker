defmodule StandrewsBustracker.StopControllerTest do
  use StandrewsBustracker.ConnCase

  alias StandrewsBustracker.Stop
  @valid_attrs %{lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, stop_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing stops"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, stop_path(conn, :new)
    assert html_response(conn, 200) =~ "New stop"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, stop_path(conn, :create), stop: @valid_attrs
    assert redirected_to(conn) == stop_path(conn, :index)
    assert Repo.get_by(Stop, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, stop_path(conn, :create), stop: @invalid_attrs
    assert html_response(conn, 200) =~ "New stop"
  end

  test "shows chosen resource", %{conn: conn} do
    stop = Repo.insert! %Stop{}
    conn = get conn, stop_path(conn, :show, stop)
    assert html_response(conn, 200) =~ "Show stop"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, stop_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    stop = Repo.insert! %Stop{}
    conn = get conn, stop_path(conn, :edit, stop)
    assert html_response(conn, 200) =~ "Edit stop"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    stop = Repo.insert! %Stop{}
    conn = put conn, stop_path(conn, :update, stop), stop: @valid_attrs
    assert redirected_to(conn) == stop_path(conn, :show, stop)
    assert Repo.get_by(Stop, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    stop = Repo.insert! %Stop{}
    conn = put conn, stop_path(conn, :update, stop), stop: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit stop"
  end

  test "deletes chosen resource", %{conn: conn} do
    stop = Repo.insert! %Stop{}
    conn = delete conn, stop_path(conn, :delete, stop)
    assert redirected_to(conn) == stop_path(conn, :index)
    refute Repo.get(Stop, stop.id)
  end
end
