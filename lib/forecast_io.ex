defmodule ForecastIO do
  use HTTPotion.Base

  def process_url(url) do
    "https://api.forecast.io/forecast/" <> key <> "/" <> url
  end

  def key do
    System.get_env("FORECAST_IO_KEY")
  end

  def forecast(lat, long, options \\ %ForecastIO.Options{} )

  def forecast(lat, long, options) when is_binary(lat) and is_binary(long) do
    response = get(lat<> "," <> long <> "?" <> ForecastIO.Options.encode_query(options) )
    if HTTPotion.Response.success?(response) do
      JSON.decode(response.body)
    else
      {:error, response.body}
    end
  end

  def forecast(lat, long, options) when is_float(lat) and is_float(long) do
    latitude = Float.to_string(lat, [decimals: 8])
    longitude = Float.to_string(long, [decimals: 8])
    forecast( latitude, longitude , options)
  end

  def current(result) do
    result["currently"]
  end

  def to_celsius(farenheit) do
    (farenheit - 32.0) * (5.0/9.0)
  end

  def to_farenheit(celsius) do
    ((celsius) * (9.0/5.0)) + 32
  end

end
