defmodule ElihygWeb.ArtsController do
    use ElihygWeb, :controller
    use Absinthe.Phoenix.Controller, schema: ElihygWeb.Schema, action: [mode: :internal]

    @graphql """
    {
      arts{
        id
        description
        hash
        artist_name
        price
      }
    }
    """
    def index(conn, %{data: data}) do
        conn
        |> put_status(:ok)
        |> render("arts.json", data: data)
    end
end