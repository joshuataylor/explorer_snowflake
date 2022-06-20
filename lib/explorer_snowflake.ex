defmodule ExplorerSnowflake do
  alias Explorer.PolarsBackend.Shared
  alias ExplorerSnowflake.Native

  @impl true
  def from_snowflake_arrow(binary) when is_binary(binary) do
    case Native.df_read_snowflake_arrow(binary) do
      {:ok, df} -> {:ok, Shared.create_dataframe(df)}
      {:error, error} -> {:error, error}
    end
  end

  def convert_base64(base64) when is_bitstring(base64) do
    base64
    |> Base.decode64!()
    |> from_snowflake_arrow()
  end
end