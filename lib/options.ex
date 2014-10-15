defmodule ForecastIO.Options do
  @derive [Enumerable]
  defstruct lang: "en", units: "us", callback: nil,
    exclude: nil, exclude: nil, extend: nil

  def encode_query(options) do
    URI.encode_query(options |> Map.delete(:__struct__))
  end
end
