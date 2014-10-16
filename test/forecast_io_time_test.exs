defmodule ForecastIOTimeTest do
  use ExUnit.Case

  test "it should accept a unix timestamp" do
    {mega, secs, _ } = :erlang.now
    now = mega * 1000000 + secs
    assert {:ok, result } = ForecastIO.forecast_time("28.6353","-106.0889",now)
    assert false = Enum.empty?(result)
  end


  test "it should accept a unix timestamp using float latitude and longitude" do
    {mega, secs, _ } = :erlang.now
    now = mega * 1000000 + secs
    assert {:ok, result } = ForecastIO.forecast_time(28.6353, -106.0889, now)
    assert false = Enum.empty?(result)
  end
end
