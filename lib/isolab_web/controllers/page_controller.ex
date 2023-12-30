defmodule IsolabWeb.PageController do
  use IsolabWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def dashboard(conn, _params) do
    render(conn, :dashboard)
  end
end
