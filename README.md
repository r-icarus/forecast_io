ForecastIO
==========

Simple wrapper for Forecast.IO


## Usage

```bash
export FORECAST_IO_KEY=yourkey
```

##Include forecast_io
```elixir
defp deps do
  [
    {:forecast_io, "~> 0.2.2"},
  ]
end
```

#Start and use
```elixir
ForecastIO.start()
{:ok, result } = ForecastIO.forecast("28.6353","-106.0889")
current = ForecastIO.current(result)
```

#Use ForecastIO Time API
```elixir
{mega, secs, _ } = :os.timestamp
now = mega * 1000000 + secs
ForecastIO.start()
{:ok, result } = ForecastIO.forecast_time("28.6353","-106.0889", now)
current = ForecastIO.current(result)
```
