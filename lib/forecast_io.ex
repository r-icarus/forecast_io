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

  def current_celsius(result) do
    temperature = to_celsius(current(result)["temperature"])
    apparent = to_celsius(current(result)["apparentTemperature"])
    dew_point = to_celsius(current(result)["dewPoint"])
    Map.merge(current(result), %{"temperatureCelsius" => temperature,
      "apparentTemperatureCelsius" => apparent,
      "dewPointCelsius" => dew_point})
  end

  def to_celsius(farenheit) do
    (farenheit - 32.0) * (5.0/9.0)
  end
end
