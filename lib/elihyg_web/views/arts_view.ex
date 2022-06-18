defmodule ElihygWeb.ArtsView do
    use ElihygWeb, :view

    def render("arts.json", %{data: %{arts: arts}}) do
        %{arts: render_many(arts, ElihygWeb.ArtsView, "art.json", as: :art)}
    end

    def render("art.json", %{art: art}) do
    %{
      id: art.id,
      artist_name: art.artist_name,
      description: art.description,
      price: art.price,
      hash: art.hash
    }
  end
end