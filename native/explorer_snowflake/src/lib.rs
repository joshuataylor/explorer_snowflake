mod snowflake_polars;

use explorer::*;
use rustler::Binary;
use crate::snowflake_polars::ipc_binary_to_dataframe;

rustler::init!(
    "Elixir.ExplorerSnowflake.Native",
    [df_read_snowflake_arrow]
);

#[rustler::nif(schedule = "DirtyIo")]
pub fn df_read_snowflake_arrow(arrow_stream_data: Binary) -> Result<ExDataFrame, ExplorerError> {
    let df = ipc_binary_to_dataframe(&mut arrow_stream_data.as_ref()).unwrap();
    Ok(ExDataFrame::new(df))
}