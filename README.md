# Housem

## To run

```
mix deps.get
mix ecto.create
mix phx.server
xdg-open http://localhost:4000
```

## Sample ops

```
curl -X POST -d '{ "data": { "attributes": { "name": "Piano" }} }' -H 'Accept: application/vnd.api+json' -H 'Content-Type: application/vnd.api+json' http://localhost:4000/api/items | jq
```

```
curl -H 'Accept: application/vnd.api+json' -H 'Content-Type: application/vnd.api+json' http://localhost:4000/api/items | jq
```
