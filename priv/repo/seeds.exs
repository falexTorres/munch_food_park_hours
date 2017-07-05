# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MunchHours.Repo.insert!(%MunchHours.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MunchHours.Repo
alias MunchHours.User
alias Comeonin.Bcrypt

Repo.delete_all(User)

Repo.insert!(%User{
    email: "mahaleys@gmail.com",
    crypted_password: Bcrypt.hashpwsalt("mahaleys"),
    truck_name: "Mahaley's At The Park"
})

Repo.insert!(%User{
    email: "axissmokehouse@gmail.com",
    crypted_password: Bcrypt.hashpwsalt("axissmokehouse"),
    truck_name: "Axis Smokehouse"
})

Repo.insert!(%User{
    email: "biscuitandpieco@gmail.com",
    crypted_password: Bcrypt.hashpwsalt("biscuitandpieco"),
    truck_name: "Bender Biscuit And Pie Co."
})

Repo.insert!(%User{
    email: "mauishaveice@gmail.com",
    crypted_password: Comeonin.Bcrypt.hashpwsalt("mauishaveice"),
    truck_name: "Maui Shave Ice & Dogz"
})

Repo.insert!(%User{
    email: "beveragebarn@gmail.com",
    crypted_password: Comeonin.Bcrypt.hashpwsalt("beveragebarn"),
    truck_name: "The Beverage Barn"
})

Repo.insert!(%User{
    email: "guest@gmail.com",
    crypted_password: Comeonin.Bcrypt.hashpwsalt("guest"),
    truck_name: "Reserve This Slot Today!"
})
