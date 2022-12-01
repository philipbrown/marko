defmodule MarkoWeb.PageALive do
  @moduledoc """
  Page A LiveView
  """

  use MarkoWeb, :live_view

  import MarkoWeb.PageComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Page A")}
  end

  def render(assigns) do
    ~H"""
    <.page id="page_a" phx-hook="Tracking" tracking={@tracking}>
      <:title>Page A</:title>

      <ul class="list-disc">
        <li>
          <.link navigate={~p"/page_b"} class="underline">
            Page B
          </.link>
        </li>
        <li>
          <.link navigate={~p"/page_c/tab_1"} class="underline">
            Page C, Tab 1
          </.link>
        </li>
      </ul>
    </.page>
    """
  end
end
