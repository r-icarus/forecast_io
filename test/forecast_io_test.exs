defmodule ForecastIOTest do
  use ExUnit.Case

  test "the result should be a decoded json object" do
    assert {:ok, result } = ForecastIO.forecast("41.015268,29.139004")
    assert false = Enum.empty?(result)
  end

  test "result should have the current temperature" do
    {:ok, result } = ForecastIO.forecast("41.015268,29.139004")
    current = ForecastIO.current(result)
    assert true = is_float current["temperature"]
  end
end
