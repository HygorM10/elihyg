defmodule Elihyg.Arts.Create do
    alias Elihyg.{Art, Repo}

    def call(params) do 
        params
        |> Art.changeset()
        |> Repo.insert()
    end
end