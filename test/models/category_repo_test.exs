defmodule Rumbl.CategoryRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.Category

  test "alphabetical/1 orders by name" do
    for name <- ~w(c b a) do
      Repo.insert!(%Category{name: name})
    end

    query = Category |> Category.alphabetical()
    query = from c in query, select: c.name

    assert Repo.all(query) == ~w(a b c)
  end
end
