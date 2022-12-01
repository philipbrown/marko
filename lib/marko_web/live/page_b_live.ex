defmodule MarkoWeb.PageBLive do
  @moduledoc """
  Page B LiveView
  """

  use MarkoWeb, :live_view

  import MarkoWeb.PageComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Page B")}
  end

  def render(assigns) do
    ~H"""
    <.page id="page_b" phx-hook="Tracking" tracking={@tracking}>
      <:title>Page B</:title>

      <ul class="list-disc">
        <li>
          <.link navigate={~p"/page_a"} class="underline">
            Page A
          </.link>
        </li>
        <li>
          <.link navigate={~p"/page_c/tab_2"} class="underline">
            Page C, Tab 2
          </.link>
        </li>
      </ul>
    </.page>
    """
  end
end
