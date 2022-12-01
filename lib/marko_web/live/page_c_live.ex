defmodule MarkoWeb.PageCLive do
  @moduledoc """
  Page C LiveView
  """

  use MarkoWeb, :live_view

  @tabs tab_1: "Page C, Tab 1",
        tab_2: "Page C, Tab 2"

  def mount(_params, _session, %{assigns: %{live_action: :index}} = socket) do
    tab = @tabs |> Keyword.keys() |> Enum.random()

    {:ok, push_navigate(socket, to: tab_path(tab))}
  end

  def mount(_params, _session, %{assigns: %{live_action: action}} = socket) do
    {:ok,
     socket
     |> assign(tabs: @tabs)
     |> assign(page_title: Keyword.fetch!(@tabs, action))}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>
        <%= Keyword.fetch!(@tabs, @live_action) %>
      </h1>

      <.live_component id="tab_list" active={@live_action} module={MarkoWeb.TabListComponent}>
        <:tab id={:tab_1} title="Tab 1" path={~p"/page_c/tab_1"}>
          <.link navigate={~p"/page_b"} class="underline">
            Page B
          </.link>
        </:tab>
        <:tab id={:tab_2} title="Tab 2" path={~p"/page_c/tab_2"}>
          <.link navigate={~p"/page_a"} class="underline">
            Page A
          </.link>
        </:tab>
      </.live_component>
    </div>
    """
  end

  ###########
  # Private #
  ###########

  defp tab_path(:tab_1), do: ~p"/page_c/tab_1"
  defp tab_path(:tab_2), do: ~p"/page_c/tab_2"
end
