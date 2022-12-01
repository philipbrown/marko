defmodule Marko.Repo.Migrations.AlterTrackingSessionTable do
  use Ecto.Migration

  def change do
    rename table(:tracking_session), to: table(:tracking_sessions)

    alter table(:tracking_sessions) do
      remove :view
      remove :engagement_time
    end

    create unique_index(:tracking_sessions, [:session_id])
  end
end
