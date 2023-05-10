defmodule MmWeb.MmView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="">
      <div>
        Greetings. <%= @msg %>
      </div>
    </div>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, msg: "Ready!")}
  end
end
