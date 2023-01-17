defmodule Wh40ktoe.Weapons.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wh40ktoe.Weapons.Profiles` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        ap: 42,
        damage: 42,
        name: "some name",
        notes: "some notes",
        range: "some range",
        strength: 42,
        type: "some type"
      })
      |> Wh40ktoe.Weapons.Profiles.create_profile()

    profile
  end
end
