json.extract! pokemon, :id, :name, :trainer_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
