defmodule ElectronPhoenix.PageController do
  use ElectronPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def counter(conn, _params) do
    render conn, "counter.html"
  end
end
