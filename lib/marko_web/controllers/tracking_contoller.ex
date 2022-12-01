defmodule MarkoWeb.TrackingController do
  use MarkoWeb, :controller

  alias Marko.{Token, Tracking}

  def accept(conn, params) do
    {:ok, _} =
      params
      |> Map.update!("view", &Token.decrypt/1)
      |> Tracking.insert()

    text(conn, "ok")
  end
end
