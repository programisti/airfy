defmodule AirfyTest do
  use ExUnit.Case
  doctest Airfy

  test "the truth" do
    {status, response} = Airfy.encrypt("test")
    IO.inspect response
    assert status == :ok
  end
end
