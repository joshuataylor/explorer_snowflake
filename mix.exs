defmodule ExplorerSnowflake.MixProject do
  use Mix.Project

  def project do
    [
      app: :explorer_snowflake,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.25.0"},
      {:benchee, "~> 1.1", optional: true},
      {:explorer, github: "elixir-nx/explorer"}
    ]
  end
end
