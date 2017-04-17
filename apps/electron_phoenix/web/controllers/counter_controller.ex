defmodule ElectronPhoenix.CounterController do
  use ElectronPhoenix.Web, :controller

  def index(conn, %{"value" => value}) do
    render conn, "index.html", value: value
  end
  def index(conn, _params) do
    render conn, "index.html", value: 0
  end

  def increment(conn, %{"value" => value}) do
    redirect conn, to: "/counter/#{Counter.increment(String.to_integer value)}"
  end

  def decrement(conn, %{"value" => value}) do
    redirect conn, to: "/counter/#{Counter.decrement(String.to_integer value)}"
  end

  def increment_if_odd(conn, %{"value" => value}) do
    redirect conn, to: "/counter/#{Counter.increment_if_odd(String.to_integer value)}"
  end
end
