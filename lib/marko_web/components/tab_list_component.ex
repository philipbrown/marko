defmodule MarkoWeb.TabListComponent do
  @moduledoc """
  A component for rendering and interacting with a list of tabs.

  There is no need for this to be a live_component.
  """

  use MarkoWeb, :live_component

  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div id={@id} class="border border-gray-200">
      <div class="flex bg-gray-100 divide-x divide-gray-200">
        <%= for {tab, i} <- Enum.with_index(@tab) do %>
          <button
            phx-click={
              switch_tab(@id, i)
              |> JS.patch(tab.path)
            }
            disabled={tab.id == @active}
            data-status={status(tab.id, @active)}
            class="data-[status=active]:bg-gray-50 px-6 py-4"
          >
            <%= tab.title %>
          </button>
        <% end %>
      </div>
      <%= for {tab, i} <- Enum.with_index(@tab) do %>
        <div
          id={"#{@id}-#{i}-content"}
          data-status={status(tab.id, @active)}
          class="bg-gray-50 data-[status=inactive]:hidden"
          data-tab-content
        >
          <div class="p-4">
            <%= render_slot(tab) %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  ###########
  # Private #
  ###########

  defp status(v, v), do: "active"
  defp status(_id, _active), do: "inactive"

  defp switch_tab(js \\ %JS{}, id, i) do
    js
    |> JS.add_class("hidden", to: "##{id} [data-tab-content]")
    |> JS.remove_class("hidden", to: "##{id}-#{i}-content")
  end
end
