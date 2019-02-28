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

<<<<<<< HEAD
# v_photos = photos.select { |p| p.orientation == 'V' }

# v_photos.each_with_index do |photo, index|
#   next if index.odd?

#   slides << Slide.new(photo, v_photos[index + 1])
# end

# pp slides

tags = {}
photos.each do |photo|
  photo.tags.each do |tag|
    tags[tag] = [] if tags[tag].nil?
    tags[tag] << photo
  end
end

puts 'tags'
pp tags

pp photos
s = Slide.new(photos[1], photos[2])
sa = Slide.new(photos[3])
puts 's'
pp s

puts 'sa'
pp sa

pp s.score sa
=======
v_photos = photos.select { |p| p.orientation == 'V' }

def optimal_photo(photos)
  starting_photo = photos.first
  best_score = 0
  chosen_slide = nil
  photos[1..].each do |current_photo|
    current_slide = Slide.new(starting_photo, current_photo)
    chosen_slide = current_slide if current_slide.score > best_score?
  end
  return chosen_slide
end

pp optimal_photo(v_photos)
>>>>>>> fix it please
