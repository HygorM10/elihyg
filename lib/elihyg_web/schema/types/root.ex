defmodule ElihygWeb.Schema.Types.Root do
    use Absinthe.Schema.Notation

    alias ElihygWeb.Schema.Types
    alias ElihygWeb.Resolvers.Art, as: ArtResolver

    import_types Types.Art
    import_types Types.Custom.UUID4

    object :root_query do
        @desc "Get art by id"
        field :art, type: :art do
            arg :id, non_null(:uuid4)

            resolve &ArtResolver.get/2
        end
    end 

    object :root_mutation do
        @desc "Create a new art"
        field :create_art, type: :art do
            arg :input, non_null(:create_art_input)

            resolve &ArtResolver.create/2
        end
    end
end