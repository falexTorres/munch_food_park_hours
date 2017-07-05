defmodule MunchHours.Truck do
    def update(changeset, repo) do
        changeset
        repo.insert_or_update(changeset)
        {:ok, changeset}
    end
end