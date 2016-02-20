defmodule StandrewsBustracker.LocationController do
  use StandrewsBustracker.Web, :controller

  alias StandrewsBustracker.Location

  plug :scrub_params, "location" when action in [:create, :update]

  def index(conn, _params) do
    conn
    # |> put_layout(false)
    |> render "index.html"
  end

  def last(conn, _params) do
    query = Ecto.Query.from(l in Location,
      order_by: [desc: l.id],
      limit: 1)
    location = Repo.one(query)
    render(conn, "show.json", location: location)
  end

  def create(conn, %{"location" => location_params}) do
    changeset = Location.changeset(%Location{}, location_params)

    case Repo.insert(changeset) do
      {:ok, location} ->
        conn
        |> send_resp(201, "")
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(StandrewsBustracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

    # def show(conn, %{"id" => id}) do
    #   location = Repo.get!(Location, id)
    #   render(conn, "show.json", location: location)
    # end

    # def update(conn, %{"id" => id, "location" => location_params}) do
    #   location = Repo.get!(Location, id)
    #   changeset = Location.changeset(location, location_params)
    #
    #   case Repo.update(changeset) do
    #     {:ok, location} ->
    #       render(conn, "show.json", location: location)
    #     {:error, changeset} ->
    #       conn
    #       |> put_status(:unprocessable_entity)
    #       |> render(StandrewsBustracker.ChangesetView, "error.json", changeset: changeset)
    #   end
    # end
  #
  # def delete(conn, %{"id" => id}) do
  #   location = Repo.get!(Location, id)
  #
  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(location)
  #
  #   send_resp(conn, :no_content, "")
  # end
end
