defmodule Marko.Tracking do
  @moduledoc """
  A module for handling the tracking domain logic
  """

  alias Marko.{Repo, Tracking}

  @doc """
  Insert tracking data
  """
  @spec insert(map()) :: {:ok, any()} | {:error, any()}
  def insert(params) do
    Ecto.Multi.new()
    |> Ecto.Multi.insert(:session, fn _ ->
      Tracking.Session.changeset(%Tracking.Session{}, params)
    end, on_conflict: :nothing)
    |> Ecto.Multi.insert(:pageview, fn _ ->
      Tracking.Pageview.changeset(%Tracking.Pageview{}, params)
    end)
    |> Repo.transaction()
  end
end
