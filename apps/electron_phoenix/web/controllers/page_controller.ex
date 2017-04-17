defmodule ElectronPhoenix.PageController do
  use ElectronPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
