defmodule ElectronPhoenix.CounterChannel do
  @moduledoc false
  use ElectronPhoenix.Web, :channel

  def join("counter:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("increment", %{"value" => value}, socket) do
    {:reply, {:ok, %{"value" => Counter.increment(value)}}, socket}
  end

  def handle_in("decrement", %{"value" => value}, socket) do
    {:reply, {:ok, %{"value" => Counter.decrement(value)}}, socket}
  end

  def handle_in("increment_if_odd", %{"value" => value}, socket) do
    {:reply, {:ok, %{"value" => Counter.increment_if_odd(value)}}, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (counter:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
