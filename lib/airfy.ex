defmodule Airfy do
  def encrypt(data) when is_binary(data) do
    case get_key do
      [{"key", key}] -> RsaEx.encrypt(data, key)
      [] -> {:error, "unable to get public key"}
      _ ->  {:error, "Error while loading file"}
    end
  end

  defp get_key do
    try do
      :ets.lookup(:key_registry, "key")
    rescue _ in ArgumentError ->
      read_key_from_file |> save_key
      get_key
    end
  end

  defp read_key_from_file, do: File.read!("public_key")
  defp save_key(key), do: :ets.new(:key_registry, [:named_table]) |> :ets.insert_new({"key", key})
end
