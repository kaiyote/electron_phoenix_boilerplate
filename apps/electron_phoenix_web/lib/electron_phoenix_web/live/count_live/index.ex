defmodule ElectronPhoenixWeb.CountLive.Index do
  use ElectronPhoenixWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def handle_event("increment", _, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end

  def handle_event("decrement", _, socket) do
    {:noreply, assign(socket, count: socket.assigns.count - 1)}
  end

  def handle_event("increment_if_odd", _, socket) when rem(socket.assigns.count, 2) == 1 do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end

  def handle_event(_, _, socket), do: {:noreply, socket}
end
