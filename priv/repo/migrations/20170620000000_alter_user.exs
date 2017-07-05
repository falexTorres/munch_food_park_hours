defmodule MunchHours.Repo.Migrations.AlterUser do
  use Ecto.Migration

  def change do
    alter table(:user) do
      add :truck_name, :string
      
      add :open_time_sunday, :time, default: "00:00:00.000000"
      add :close_time_sunday, :time, default: "00:00:00.000000"

      add :open_time_monday, :time, default: "00:00:00.000000"
      add :close_time_monday, :time, default: "00:00:00.000000"

      add :open_time_tuesday, :time, default: "00:00:00.000000"
      add :close_time_tuesday, :time, default: "00:00:00.000000"

      add :open_time_wednesday, :time, default: "00:00:00.000000"
      add :close_time_wednesday, :time, default: "00:00:00.000000"

      add :open_time_thursday, :time, default: "00:00:00.000000"
      add :close_time_thursday, :time, default: "00:00:00.000000"

      add :open_time_friday, :time, default: "00:00:00.000000"
      add :close_time_friday, :time, default: "00:00:00.000000"

      add :open_time_saturday, :time, default: "00:00:00.000000"
      add :close_time_saturday, :time, default: "00:00:00.000000"

      add :start_lunch_sunday, :time, default: "00:00:00.000000"
      add :end_lunch_sunday, :time, default: "00:00:00.000000"

      add :start_lunch_monday, :time, default: "00:00:00.000000"
      add :end_lunch_monday, :time, default: "00:00:00.000000"

      add :start_lunch_tuesday, :time, default: "00:00:00.000000"
      add :end_lunch_tuesday,:time, default: "00:00:00.000000"

      add :start_lunch_wednesday, :time, default: "00:00:00.000000"
      add :end_lunch_wednesday, :time, default: "00:00:00.000000"
      
      add :start_lunch_thursday,:time, default: "00:00:00.000000"
      add :end_lunch_thursday,:time, default: "00:00:00.000000"

      add :start_lunch_friday,:time, default: "00:00:00.000000"
      add :end_lunch_friday, :time, default: "00:00:00.000000"

      add :start_lunch_saturday, :time, default: "00:00:00.000000"
      add :end_lunch_saturday, :time, default: "00:00:00.000000"
    end

    create unique_index(:user, [:truck_name])

  end
end