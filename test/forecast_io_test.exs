defmodule ForecastIOTest do
  use ExUnit.Case

  test "the result should be a decoded json object" do
    assert {:ok, result } = ForecastIO.forecast("28.6353,-106.0889")
    assert false = Enum.empty?(result)
  end

  test "result should have the current temperature" do
    {:ok, result } = ForecastIO.forecast("28.6353,-106.0889")
    current = ForecastIO.current(result)
    assert true = is_float current["temperature"]
  end

  test "you can select a language supported by forecast io" do
    {:ok, result } = ForecastIO.forecast("28.6353,-106.0889", %ForecastIO.Options{lang: "es"})
    current = ForecastIO.current(result)
    assert true = is_float current["temperature"]
  end

  test "should convert to celsius" do
    result = ForecastIO.to_celsius(86.0)
    assert 30.0 = result
  end

  test "should convert to farenheit" do
    result = ForecastIO.to_farenheit(30.0)
    assert 86.0 = result
  end

  test "you should convert options to a query string" do
    options = %ForecastIO.Options{}
    encoded = ForecastIO.Options.encode_query(options)
    assert encoded = "callback=&exclude=&extend=&lang=en&units=us"
  end
end
