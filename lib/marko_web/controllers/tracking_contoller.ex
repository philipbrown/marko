defmodule MarkoWeb.TrackingController do
  use MarkoWeb, :controller

  alias Marko.{Token, TrackingSession}

  def accept(conn, params) do
    {:ok, _} =
      params
      |> Map.update!("view", &Token.decrypt/1)
      |> TrackingSession.insert()

    text(conn, "ok")
  end
end
