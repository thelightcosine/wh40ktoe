defmodule Wh40ktoe.Weapons.Profiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapon_profiles" do
    field :ap, :integer
    field :damage, :integer
    field :name, :string
    field :notes, :string
    field :range, :string
    field :strength, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :range, :type, :strength, :ap, :damage, :notes])
    |> validate_required([:name, :range, :type, :strength, :ap, :damage, :notes])
  end
end
