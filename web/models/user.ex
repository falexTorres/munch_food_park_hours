defmodule MunchHours.User do
  use MunchHours.Web, :model

  schema "user" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    field :truck_name, :string

    field :open_time_sunday, :time
    field :close_time_sunday, :time
    field :start_lunch_sunday, :time
    field :end_lunch_sunday, :time

    field :open_time_monday, :time
    field :close_time_monday, :time
    field :start_lunch_monday, :time
    field :end_lunch_monday, :time

    field :open_time_tuesday, :time
    field :close_time_tuesday, :time
    field :start_lunch_tuesday, :time
    field :end_lunch_tuesday, :time

    field :open_time_wednesday, :time
    field :close_time_wednesday, :time
    field :start_lunch_wednesday, :time
    field :end_lunch_wednesday, :time

    field :open_time_thursday, :time
    field :close_time_thursday, :time
    field :start_lunch_thursday, :time
    field :end_lunch_thursday, :time

    field :open_time_friday, :time
    field :close_time_friday, :time
    field :start_lunch_friday, :time
    field :end_lunch_friday, :time

    field :open_time_saturday, :time
    field :close_time_saturday, :time
    field :start_lunch_saturday, :time
    field :end_lunch_saturday, :time

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end

  def changeset_change_times(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :open_time_sunday,
      :close_time_sunday,

      :open_time_monday,
      :close_time_monday,

      :open_time_tuesday,
      :close_time_tuesday,

      :open_time_wednesday,
      :close_time_wednesday,

      :open_time_thursday,
      :close_time_thursday,

      :open_time_friday,
      :close_time_friday,

      :open_time_saturday,
      :close_time_saturday,

      :start_lunch_sunday, 
      :end_lunch_sunday, 

      :start_lunch_monday, 
      :end_lunch_monday, 

      :start_lunch_tuesday, 
      :end_lunch_tuesday,

      :start_lunch_wednesday, 
      :end_lunch_wednesday, 
      
      :start_lunch_thursday,
      :end_lunch_thursday,

      :start_lunch_friday,
      :end_lunch_friday, 

      :start_lunch_saturday,
      :end_lunch_saturday
    ])
    |> validate_required([
      :open_time_sunday,
      :close_time_sunday,

      :open_time_monday,
      :close_time_monday,

      :open_time_tuesday,
      :close_time_tuesday,

      :open_time_wednesday,
      :close_time_wednesday,

      :open_time_thursday,
      :close_time_thursday,

      :open_time_friday,
      :close_time_friday,

      :open_time_saturday,
      :close_time_saturday,

      :start_lunch_sunday, 
      :end_lunch_sunday, 

      :start_lunch_monday, 
      :end_lunch_monday, 

      :start_lunch_tuesday, 
      :end_lunch_tuesday,

      :start_lunch_wednesday, 
      :end_lunch_wednesday, 

      :start_lunch_thursday,
      :end_lunch_thursday,

      :start_lunch_friday,
      :end_lunch_friday, 
      
      :start_lunch_saturday,
      :end_lunch_saturday
    ])
  end
end
