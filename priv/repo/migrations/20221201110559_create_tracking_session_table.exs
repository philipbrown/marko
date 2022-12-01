defmodule Marko.Repo.Migrations.CreateTrackingSessionTable do
  use Ecto.Migration

  def change do
    create table(:tracking_session) do
      add :session_id, :text
      add :view, :text
      add :engagement_time, :integer
      add :browser_agent, :text
    end
  end
end
