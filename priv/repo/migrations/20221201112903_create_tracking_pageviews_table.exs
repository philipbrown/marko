defmodule Marko.Repo.Migrations.CreateTrackingPageviewsTable do
  use Ecto.Migration

  def change do
    create table(:tracking_pageviews) do
      add :session_id, :text
      add :view, :text
      add :engagement_time, :integer
    end

    create index(:tracking_pageviews, [:session_id])
  end
end
