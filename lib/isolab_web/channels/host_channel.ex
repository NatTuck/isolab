defmodule IsolabWeb.HostChannel do
  use IsolabWeb, :channel

  @impl true
  def join("host:" <> name, %{"token" => token}, socket) do
    IO.inspect({:join_from, name})
    if authorized?(token) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(token) do
    token == Application.fetch_env!(:isolab, :host_token)
  end
end
