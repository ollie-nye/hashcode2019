require_relative './parser'
require_relative './photo'
require_relative './slide'

photos = Parser.new('a_example.txt').photos
# print photos.first.inspect
# print photos[1].inspect
# puts photos.first.tags_shared_with(photos[1])
# puts photos.first.tags_different_from(photos[1])
# pp photos

# slides = []

# photos.each do |photo|
#   slides << Slide.new(photo) if photo.orientation == 'H'
# end

# v_photos = photos.select { |p| p.orientation == 'V' }

# v_photos.each_with_index do |photo, index|
#   next if index.odd?

#   slides << Slide.new(photo, v_photos[index + 1])
# end

# pp slides
pp photos
s = Slide.new(photos[1], photos[2])
sa = Slide.new(photos[3])
puts 's'
pp s

puts 'sa'
pp sa

pp s.score sa
