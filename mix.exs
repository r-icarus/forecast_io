defmodule ForecastIO.Mixfile do
  use Mix.Project

  def project do
    [app: :forecast_io,
     version: "0.2.2",
     elixir: "~> 1.2.0",
     deps: deps,
     package: [
       contributors: ["Ricardo Echavarria", "Col", "Ross Jones", "Jeff Weiss"],
       maintainers: ["Ricardo Echavarria"],
       licenses: ["MIT"],
       links: %{github: "https://github.com/r-icarus/forecast_io"}
     ],
     description: """
     Simple wrapper for Forecast.IO API
     """]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:httpotion, "~> 2.0"},
      {:json,   "~> 0.3.0"},
    ]
  end
end
