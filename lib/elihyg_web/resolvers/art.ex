defmodule ElihygWeb.Resolvers.Art do
    alias Elihyg.Arts

    def get(%{id: art_id}, _context), do: Arts.get(art_id)
    def create(%{input: params}, _context), do: Arts.create(params)
end