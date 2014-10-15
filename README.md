ForecastIO
==========

Simple wrapper for Forecast.IO


## Usage

```bash
export FORECAST_IO_KEY=yourkey
```

```elixir
ForecastIO.start()
{:ok, result } = ForecastIO.forecast("28.6353,-106.0889")
current = ForecastIO.current(result)
```
