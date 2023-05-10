defmodule MmWeb.PageController do
  use MmWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, MmWeb.MmView, session: %{})
  end

end
