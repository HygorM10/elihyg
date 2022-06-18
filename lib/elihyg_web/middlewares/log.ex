defmodule Elihyg.Middlewares.Log do
    require Logger

    @behaviour Absinthe.Middleware

    @filter_string "[FILTERED]"
    @replacements [{~r/hash: "\w*"/, "hash: #{@filter_string}"}]

    def call(resolution, _) do
        resolution
        |> log_message()
        |> filter_info()
        |> Logger.debug()

        resolution
    end

    defp log_message(%Absinthe.Resolution{value: value}), do: "Resolution value: #{inspect(value)}"

    defp filter_info(log) do
        Enum.reduce(@replacements, log, fn {regex, replacement}, log ->
            String.replace(log, regex, replacement)
        end)
    end
end