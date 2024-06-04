defmodule Housem.Repo.Migrations.AddItemsAndTags do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:tags, primary_key: false) do
      add :id, :bigserial, null: false, primary_key: true
      add :name, :text, null: false
    end

    create table(:items_tags, primary_key: false) do
      add :id, :bigserial, null: false, primary_key: true
      add :item_id, :uuid
      add :tag_id, :bigint
    end

    create table(:items, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("gen_random_uuid()"), primary_key: true
    end

    alter table(:items_tags) do
      modify :item_id,
             references(:items,
               column: :id,
               name: "items_tags_item_id_fkey",
               type: :uuid,
               prefix: "public"
             )

      modify :tag_id,
             references(:tags,
               column: :id,
               name: "items_tags_tag_id_fkey",
               type: :bigint,
               prefix: "public"
             )
    end

    alter table(:items) do
      add :name, :text, null: false
      add :count, :bigint, default: 1
    end
  end

  def down do
    alter table(:items) do
      remove :count
      remove :name
    end

    drop constraint(:items_tags, "items_tags_item_id_fkey")

    drop constraint(:items_tags, "items_tags_tag_id_fkey")

    alter table(:items_tags) do
      modify :tag_id, :bigint
      modify :item_id, :uuid
    end

    drop table(:items)

    drop table(:items_tags)

    drop table(:tags)
  end
end
