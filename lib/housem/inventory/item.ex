defmodule Housem.Inventory.Item do
  use Ash.Resource,
    domain: Housem.Inventory,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource]

  json_api do
    type "item"

    routes do
      base("/items")

      get(:read)
      index :read
      post(:create)
    end
  end

  postgres do
    table "items"
    repo Housem.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :count, :integer do
      default 1
    end
  end

  actions do
    defaults [:read]

    create :create do
      accept [:name, :count]
    end
  end

  relationships do
    many_to_many :tags, Housem.Inventory.Tag, through: Housem.Inventory.ItemTag
  end
end
