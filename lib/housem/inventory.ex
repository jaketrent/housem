defmodule Housem.Inventory do
  use Ash.Domain

  resources do
    resource Housem.Inventory.Item
    resource Housem.Inventory.Tag
    resource Housem.Inventory.ItemTag
  end
end
