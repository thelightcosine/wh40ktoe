defmodule Wh40ktoe.Weapons.ProfilesTest do
  use Wh40ktoe.DataCase

  alias Wh40ktoe.Weapons.Profiles

  describe "weapon_profiles" do
    alias Wh40ktoe.Weapons.Profiles.Profile

    import Wh40ktoe.Weapons.ProfilesFixtures

    @invalid_attrs %{ap: nil, damage: nil, name: nil, notes: nil, range: nil, strength: nil, type: nil}

    test "list_weapon_profiles/0 returns all weapon_profiles" do
      profile = profile_fixture()
      assert Profiles.list_weapon_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Profiles.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{ap: 42, damage: 42, name: "some name", notes: "some notes", range: "some range", strength: 42, type: "some type"}

      assert {:ok, %Profile{} = profile} = Profiles.create_profile(valid_attrs)
      assert profile.ap == 42
      assert profile.damage == 42
      assert profile.name == "some name"
      assert profile.notes == "some notes"
      assert profile.range == "some range"
      assert profile.strength == 42
      assert profile.type == "some type"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{ap: 43, damage: 43, name: "some updated name", notes: "some updated notes", range: "some updated range", strength: 43, type: "some updated type"}

      assert {:ok, %Profile{} = profile} = Profiles.update_profile(profile, update_attrs)
      assert profile.ap == 43
      assert profile.damage == 43
      assert profile.name == "some updated name"
      assert profile.notes == "some updated notes"
      assert profile.range == "some updated range"
      assert profile.strength == 43
      assert profile.type == "some updated type"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_profile(profile, @invalid_attrs)
      assert profile == Profiles.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Profiles.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Profiles.change_profile(profile)
    end
  end
end
