defmodule StandrewsBustracker.StopController do
  use StandrewsBustracker.Web, :controller

  alias StandrewsBustracker.Stop

  plug :scrub_params, "stop" when action in [:create, :update]

  def index(conn, _params) do
    stops = Repo.all(Stop)
    render(conn, "index.html", stops: stops)
  end

  def new(conn, _params) do
    changeset = Stop.changeset(%Stop{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"stop" => stop_params}) do
    changeset = Stop.changeset(%Stop{}, stop_params)

    case Repo.insert(changeset) do
      {:ok, _stop} ->
        conn
        |> put_flash(:info, "Stop created successfully.")
        |> redirect(to: stop_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    stop = Repo.get!(Stop, id)
    render(conn, "show.html", stop: stop)
  end

  def edit(conn, %{"id" => id}) do
    stop = Repo.get!(Stop, id)
    changeset = Stop.changeset(stop)
    render(conn, "edit.html", stop: stop, changeset: changeset)
  end

  def update(conn, %{"id" => id, "stop" => stop_params}) do
    stop = Repo.get!(Stop, id)
    changeset = Stop.changeset(stop, stop_params)

    case Repo.update(changeset) do
      {:ok, stop} ->
        conn
        |> put_flash(:info, "Stop updated successfully.")
        |> redirect(to: stop_path(conn, :show, stop))
      {:error, changeset} ->
        render(conn, "edit.html", stop: stop, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    stop = Repo.get!(Stop, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(stop)

    conn
    |> put_flash(:info, "Stop deleted successfully.")
    |> redirect(to: stop_path(conn, :index))
  end
end
