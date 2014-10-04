defmodule ForecastIO do
  use HTTPotion.Base

  def process_url(url) do
    "https://api.forecast.io/forecast/" <> key <> "/" <> url
  end

  def key do
    System.get_env("FORECAST_IO_KEY")
  end

  def forecast(latlong) do
    response = get(latlong)
    if HTTPotion.Response.success?(response) do
      JSON.decode(response.body)
    else
      {:error, response.body}
    end
  end

  def current(result) do
    result["currently"]
  end
end
