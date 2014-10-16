ForecastIO
==========

Simple wrapper for Forecast.IO


## Usage

```bash
export FORECAST_IO_KEY=yourkey
```

##Include  ibrowse
```elixir
defp deps do
  [
    {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
  ]
end
```

#Start and use
```elixir
ForecastIO.start()
{:ok, result } = ForecastIO.forecast("28.6353,-106.0889")
current = ForecastIO.current(result)
```
