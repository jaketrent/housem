defmodule Housem.Inventory.ItemTag do
  use Ash.Resource,
    domain: Housem.Inventory,
    data_layer: Ash.DataLayer.Ets

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
