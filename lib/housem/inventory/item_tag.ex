defmodule Housem.Inventory.ItemTag do
  use Ash.Resource,
    domain: Housem.Inventory,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "items_tags"
    repo Housem.Repo
  end

  attributes do
    integer_primary_key :id
    attribute :item_id, :uuid
    attribute :tag_id, :integer
  end

  relationships do
    belongs_to :item, Housem.Inventory.Item
    belongs_to :tag, Housem.Inventory.Tag
  end
end
