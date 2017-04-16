defmodule ElectronPhoenixBoilerplate.PageController do
  use ElectronPhoenixBoilerplate.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
