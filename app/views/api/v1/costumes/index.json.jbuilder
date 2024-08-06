json.array! @costumes do |costume|
  json.extract! costume, :id, :name, :category, :size, :description, :price_per_day
end
