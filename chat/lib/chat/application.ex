defmodule Chat.Application do

  use Application

  def start(_type, _args) do
    children = [
      { Phoenix.PubSub.PG2, name: Chatty },
      { Chat.PubSub, [] },
    ]

    opts = [strategy: :one_for_one, name: Chat.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
