require_relative './parser'
require_relative './photo'
require_relative './slide'

photos = Parser.new('a_example.txt').photos
# print photos.first.inspect
# print photos[1].inspect
# puts photos.first.tags_shared_with(photos[1])
# puts photos.first.tags_different_from(photos[1])
# pp photos

pp Slide.new(photos[2], photos[1])
