defmodule MarkoWeb.SetTracking do
  @moduledoc """
  Setup the data that is required to be sent to the client for tracking.
  """

  alias Marko.Token
  alias Phoenix.Component

  def on_mount(:default, _params, %{"id" => session_id}, socket) do
    tracking = %{
      session_id: session_id,
      view: Token.encrypt(to_string(socket.view))
    }

    {:cont, Component.assign(socket, tracking: tracking)}
  end
end
