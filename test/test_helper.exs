ExUnit.start

Mix.Task.run "ecto.create", ~w(-r StandrewsBustracker.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r StandrewsBustracker.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(StandrewsBustracker.Repo)

