defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "Some User",
      username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
      password: "supersecret"
    }, attrs)

    %Rumbl.User{}
    |> Rumbl.User.registration_changeset(changes)
    |> Repo.insert!()
  end

  def insert_video(user, attrs \\ %{}) do
    changes = Dict.merge(%{
      description: "some content",
      title: "some content",
      url: "http://rumbl.test",
      user_id: user.id
    }, attrs)

    Rumbl.Video.changeset(%Rumbl.Video{}, changes)
    |> Repo.insert!
  end
end
