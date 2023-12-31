defmodule Isolabd.WsClient do
  use Slipstream, restart: :permanent

  def start_link(args) do
    Slipstream.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl Slipstream
  def init(_args) do
    connect(uri: control_uri(), )
  end

  @impl Slipstream
  def handle_connect(socket) do
    IO.puts("in handle_connect")
    {:ok, join(socket, "host:#{hostname()}", %{token: token()})}
  end

  @impl Slipstream
  def handle_join(topic, resp, socket) do
    IO.inspect({:joined, topic, resp})
    {:ok, socket}
  end

  @impl Slipstream
  def handle_message(topic, event, msg, socket) do
    IO.inspect({:message, topic, event, msg})
    {:ok, socket}
  end
  
  def control_uri() do
    host = Application.fetch_env!(:isolabd, :control_host)
    "ws://#{host}/socket/websocket"
  end

  def token() do
    Application.fetch_env!(:isolabd, :host_token)
  end

  def hostname do
    {:ok, host} = :inet.gethostname()
    to_string(host)
  end
end
