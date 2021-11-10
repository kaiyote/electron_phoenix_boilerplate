defmodule ElectronPhoenixWeb.PageController do
  use ElectronPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
