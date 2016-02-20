# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StandrewsBustracker.Repo.insert!(%StandrewsBustracker.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias StandrewsBustracker.Repo
alias StandrewsBustracker.Location
alias StandrewsBustracker.Stop

[
  %Location{
    lat: "56.3341776",
    lng: "-2.783473",
    timestamp: 1455984652
  },
  %Location{
    lat: "56.3402928",
    lng: "-2.7998448",
    timestamp: 1455984683
  }
] |> Enum.each(&Repo.insert!(&1))


[
  %Stop{
    lat: 56.3341776,
    lng: -2.783473,
    name: "ALBANY"
  },
  %Stop{
    lat: 56.3413314,
    lng: -2.7957061,
    name: "LIBRARY"
  },
  %Stop{
    lat: 56.3283371,
    lng: -2.808544,
    name: "MORRISON"
  },
  %Stop{
    lat: 56.3357399,
    lng: -2.8215376,
    name: "DRA"
  },
  %Stop{
    lat: 56.3408036,
    lng: -2.8138418,
    name: "AGNES"
  },
  %Stop{
    lat: 56.3402733,
    lng: -2.8000857,
    name: "UNION"
  }
] |> Enum.each(&Repo.insert!(&1))
