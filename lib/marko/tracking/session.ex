defmodule Marko.Tracking.Session do
  @moduledoc """
  """

  use Ecto.Schema

  @fields ~w{
    session_id
    browser_agent
  }a

  schema "tracking_sessions" do
    field :session_id, :string
    field :browser_agent, :string
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
