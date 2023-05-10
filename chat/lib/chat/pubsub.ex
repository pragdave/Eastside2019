defmodule Chat.PubSub do
  alias Phoenix.PubSub
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(not_used) do
    PubSub.subscribe(Chatty, "messages")
    { :ok,  not_used }
  end

  def handle_info({:msg, from, text}, state) do
    IO.puts "#{from}: #{text}"
    { :noreply, state }
  end

end
