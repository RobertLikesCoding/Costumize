json.extract! @costume, :id, :name, :category, :size, :description, :price_per_day, :photo_url
json.bookings @costume.bookings do |booking|
  json.extract! booking, :id, :start_date, :end_date
  json.booker do
    json.extract! booking.user, :id, :first_name
  end
end
json.owner do
  json.extract! @costume.user, :id, :first_name
end
