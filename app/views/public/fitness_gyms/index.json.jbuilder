json.data do
  json.items do
    json.array!(@fitness_gyms) do |gym|
      json.fitness_gym_id gym.id
      json.name gym.name
      json.content gym.content
      json.address gym.address
      json.latitude gym.latitude
      json.longitude gym.longitude
      json.genre_id gym.genre_id
    end  
  end
end