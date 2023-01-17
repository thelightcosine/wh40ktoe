defmodule Wh40ktoe.Repo.Migrations.CreateWeaponProfiles do
  use Ecto.Migration

  def change do
    create table(:weapon_profiles) do
      add :name, :string
      add :range, :string
      add :type, :string
      add :strength, :integer
      add :ap, :integer
      add :damage, :integer
      add :notes, :text

      timestamps()
    end
  end
end
