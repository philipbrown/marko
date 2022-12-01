defmodule Marko.Tracking.Pageview do
  @moduledoc """
  """

  use Ecto.Schema

  @fields ~w{
    session_id
    view
    engagement_time
  }a

  schema "tracking_pageviews" do
    field :session_id, :string
    field :view, :string
    field :engagement_time, :integer
  end

  @doc """
  Changeset for manipulating %Tracking.Session{} struct
  """
  @spec changeset(struct(), map()) :: Ecto.Changeset.t()
  def changeset(struct, params) do
    struct
    |> Ecto.Changeset.cast(params, @fields)
    |> Ecto.Changeset.validate_required(@fields)
  end
end
