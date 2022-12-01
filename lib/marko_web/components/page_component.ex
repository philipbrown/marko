defmodule MarkoWeb.PageComponent do
  @moduledoc """
  Page component for rendering a page template
  """

  use Phoenix.Component

  def page(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="Tracking"
      data-session-id={@tracking.session_id}
      data-view={@tracking.view}
      class="bg-gray-100 min-h-screen p-6"
    >
      <div class="bg-white rounded-md p-10 shadow-sm flex flex-col space-y-8">
        <h1 class="text-4xl font-semibold">
          <%= render_slot(@title) %>
        </h1>

        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end
end
