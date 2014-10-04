defmodule ForecastIO do
  use HTTPotion.Base

  @api_key "API_KEY"

  def process_url(url) do
    "https://api.forecast.io/forecast/" <> @api_key <> "/" <> url
  end


  def forecast(latlong) do
    response = get(latlong)
    if HTTPotion.Response.success?(response) do
      JSON.decode(response.body)
    else
      {:error, response.body}
    end
  end
end
