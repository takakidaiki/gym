json.data do
  json.items do
    json.array!(@fitness_gyms) do |gym|
      json.id gym.id
      json.name gym.name
      json.content gym.content
      json.address gym.address
      json.latitude gym.latitude
      json.longitude gym.longitude
    end  
  end
end