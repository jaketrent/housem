defmodule HousemWeb.JsonApiRouter do
  use AshJsonApi.Router,
    domains: [Module.concat(["Housem.Inventory"])],
    json_schema: "/json_schema",
    open_api: "/open_api"
end
