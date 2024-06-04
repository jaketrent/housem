defmodule Housem.Inventory.Tag do
  use Ash.Resource,
    domain: Housem.Inventory,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "tags"
    repo Housem.Repo
  end

  attributes do
    integer_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end
  end

  # identities do
  #   identity :unique_name, [:name]
  # end

  actions do
    defaults [:read]

    create :create do
      accept [:name]
    end
  end

  relationships do
    many_to_many :items, Housem.Inventory.Item, through: Housem.Inventory.ItemTag
  end
end
