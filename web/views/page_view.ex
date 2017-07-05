defmodule MunchHours.PageView do
  use MunchHours.Web, :view
  alias MunchHours.Repo
  alias MunchHours.User

  def truck_id(truck_name) do
    Enum.join(String.split(truck_name, " "), "-")
    |> String.split("'")
    |> Enum.join("")
    |> String.split(".")
    |> Enum.join("")
  end

  def all_trucks() do
    render_hours_of_operation(Repo.all(User))
  end

  defp format_truck_times(truck) do
    formatted_truck = %{
      truck_name: truck.truck_name,
      sunday_time: get_daily_time(truck.open_time_sunday, truck.start_lunch_sunday, truck.end_lunch_sunday, truck.close_time_sunday),
      monday_time: get_daily_time(truck.open_time_monday, truck.start_lunch_monday, truck.end_lunch_monday, truck.close_time_monday),
      tuesday_time: get_daily_time(truck.open_time_tuesday, truck.start_lunch_tuesday, truck.end_lunch_tuesday, truck.close_time_tuesday),
      wednesday_time: get_daily_time(truck.open_time_wednesday, truck.start_lunch_wednesday, truck.end_lunch_wednesday, truck.close_time_wednesday),
      thursday_time: get_daily_time(truck.open_time_thursday, truck.start_lunch_thursday, truck.end_lunch_thursday, truck.close_time_thursday),
      friday_time: get_daily_time(truck.open_time_friday, truck.start_lunch_friday, truck.end_lunch_friday, truck.close_time_friday),
      saturday_time: get_daily_time(truck.open_time_saturday, truck.start_lunch_saturday, truck.end_lunch_saturday, truck.close_time_saturday),
      sunday_time: get_daily_time(truck.open_time_sunday, truck.start_lunch_sunday, truck.end_lunch_sunday, truck.close_time_sunday),
    }
  end

  defp get_daily_time(~T[00:00:00.000000], ~T[00:00:00.000000], ~T[00:00:00.000000], ~T[00:00:00.000000]) do
    ~s(Closed)
  end  

  defp get_daily_time(open_time, ~T[00:00:00.000000], ~T[00:00:00.000000], close_time) do
    os = String.split(to_string(open_time), ":")
    cs = String.split(to_string(close_time), ":")
    to_am_pm_format(Enum.join([Enum.at(os, 0), Enum.at(os, 1)], ":")) <> " - " <> to_am_pm_format(Enum.join([Enum.at(cs, 0), Enum.at(cs, 1)], ":")) 
  end

  defp get_daily_time(open_time, lunch_time, end_lunch, close_time) do
    os = String.split(to_string(open_time), ":")
    bs = String.split(to_string(lunch_time), ":")
    be = String.split(to_string(end_lunch), ":")
    cs = String.split(to_string(close_time), ":")
    to_am_pm_format(Enum.join([Enum.at(os, 0), Enum.at(os, 1)], ":")) <> " - " <> to_am_pm_format(Enum.join([Enum.at(bs, 0), Enum.at(bs, 1)], ":")) <> "<br/>" <> to_am_pm_format(Enum.join([Enum.at(be, 0), Enum.at(be, 1)], ":")) <> " - " <> to_am_pm_format(Enum.join([Enum.at(cs, 0), Enum.at(cs, 1)], ":"))
  end

  defp render_hours_of_operation(trucks) do
    Enum.map(trucks, fn truck -> format_truck_times(truck) end)
  end

  defp to_am_pm_format("Closed") do
    "Closed"
  end

  defp to_am_pm_format(time) do
    hr_min = String.split(time, ":")
    hr = String.to_integer(Enum.at(hr_min, 0)) 
    min = Enum.at(hr_min, 1)
    cond do 
      hr > 12 ->
        Integer.to_string(hr - 12) <> ":" <> min <> " p.m."
      hr == 12 ->
        time <> " p.m."
      true ->
        time <> " a.m."
    end
  end
end