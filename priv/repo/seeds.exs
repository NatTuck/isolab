# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Isolab.Repo.insert!(%Isolab.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Isolab.Repo
alias Isolab.Users.User

Repo.insert!(%User{name: "nat", password_hash: Argon2.hash_pwd_salt("password")})
