defmodule ExplorerSnowflake.Native do
  use Rustler, otp_app: :explorer_snowflake, crate: :explorer_snowflake

  def df_read_snowflake_arrow(binary), do: error()

  defp error, do: :erlang.nif_error(:nif_not_loaded)
end
