defmodule IsolabWeb.Plugs do
  use IsolabWeb, :controller

  alias Isolab.Users

  def fetch_current_user!(conn, _args) do
    if user_id = get_session(conn, :user_id) do
      user = Users.get_user(user_id)
      assign(conn, :current_user, user)
    else
      conn
      |> put_flash(:error, "Access denied.")
      |> redirect(to: ~p"/")
      |> halt
    end
  end
end
