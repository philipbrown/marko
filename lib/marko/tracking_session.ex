defmodule Marko.TrackingSession do
  @moduledoc """
  """

  use Ecto.Schema

  alias Marko.Repo

  @fields ~w{
    session_id
    view
    engagement_time
    browser_agent
  }a

  schema "tracking_session" do
    field :session_id, :string
    field :view, :string
    field :engagement_time, :integer
    field :browser_agent, :string
  end

  @doc """
  Changeset for manipulating %TrackingSession{} struct
  """
  @spec changeset(struct(), map()) :: Ecto.Changeset.t()
  def changeset(struct, params) do
    struct
    |> Ecto.Changeset.cast(params, @fields)
    |> Ecto.Changeset.validate_required(@fields)
  end

  @doc """
  Insert a new tracking session
  """
  @spec insert(map()) :: {:ok, struct()} | {:error, Ecto.Changeset.t()}
  def insert(params) do
    %__MODULE__{}
    |> changeset(params)
    |> Repo.insert()
  end
end
