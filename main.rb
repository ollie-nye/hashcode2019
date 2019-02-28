require_relative './parser'
require_relative './photo'
require_relative './slide'
require_relative './tag_directory'

photos = Parser.new('c_memorable_moments.txt').photos
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

tag_dir = TagDirectory.new

photos.each do |photo|
  tag_dir.add_slide(photo)
end



# pp photos
# s = Slide.new(photos[1], photos[2])
# sa = Slide.new(photos[3])
# puts 's'
# pp s

# puts 'sa'
# pp sa

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
