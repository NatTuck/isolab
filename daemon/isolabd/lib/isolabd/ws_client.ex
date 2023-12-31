defmodule Isolabd.WsClient do
  use Slipstream, restart: :permanent

  def start_link(args) do
    Slipstream.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl Slipstream
  def init(_args) do
    {:ok, sock} = connect!(uri: "ws://localhost:4000/socket/websocket")
    
  end


  def hostname do
    {:ok, host} = :inet.gethostname()
    to_string(host)
  end
end
