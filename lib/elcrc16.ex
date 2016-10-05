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
    path = :filename.join(:code.priv_dir(:elcrc16), 'crc16_nif')
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
