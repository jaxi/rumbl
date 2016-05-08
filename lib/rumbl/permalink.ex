defmodule Rumbl.Permalink do
  @behaviour Ecto.Type

  def type, do: :id

  def cast(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {int, _} when int > 0 -> {:ok, int}
      _ -> :error
    end
  end

  def cast(integer) when is_integer(integer) do
    if integer > 0 do
      {:ok, integer}
    else
      :error
    end
  end

  def cast(_) do
    :error
  end

  def dump(integer) when is_integer(integer) do
    if integer > 0 do
      {:ok, integer}
    else
      :error
    end
  end

  def load(integer) when is_integer(integer) do
    if integer > 0 do
      {:ok, integer}
    else
      :error
    end
  end
end
