defmodule StandrewsBustracker.LocationView do
  use StandrewsBustracker.Web, :view

  def render("show.json", %{location: location}) do
    %{data: render_one(location, StandrewsBustracker.LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      lat: location.lat,
      lng: location.lng,
      timestamp: location.timestamp}
  end

end
