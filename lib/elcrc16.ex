defmodule Elcrc16 do
  @moduledoc """
  This module is used to calculate CRC (Cyclic Redundancy Check) values
  for binary data. It uses NIF functions written in C to interate over
  the given binary calculating the CRC checksum value. Uses polynomial 0x8005.
  """

  @on_load {:init, 0}

  @doc """
  Initilizes the module by loading NIFs
  """
  def init do
    # Hack to make this work in escripts.
    path = try do
             :filename.join(:code.priv_dir(:elcrc16), 'crc16_nif')
           rescue
             FunctionClauseError -> System.get_env("CRC16_NIF_PATH") <> "crc16_nif"
           end
    :ok = :erlang.load_nif(path, 0)
  end

  @doc """
  Calculates a 16-bit CRC with polynomial 0x8005.
  """
  @spec crc16(binary) :: number
  def crc16(<<data :: binary>>) do
    _crc16(data)
  end

  defp _crc16(_), do: "CRC NIF not loaded"
end
