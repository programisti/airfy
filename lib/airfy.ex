defmodule Airfy do
  def encrypt(data) when is_binary(data) do
    case File.read("public_key") do
      {:ok, content} ->
        data |> RsaEx.encrypt(content)
      {:error, reason} -> {:error, reason}
      _ -> {:error, "Error while loading file"}
    end
  end
end
