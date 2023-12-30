defmodule IsolabWeb.SessionController do
  use IsolabWeb, :controller

  alias Isolab.Users

  def create(conn, %{"name" => name, "password" => password }) do
    if user = Users.authenticate(name, password) do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.name}")
      |> redirect(to: ~p"/dashboard")
    else
      conn
      |> put_flash(:error, "Login failed.")
      |> redirect(to: ~p"/") 
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: ~p"/") 
  end
end
