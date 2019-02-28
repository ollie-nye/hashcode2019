require_relative './parser'
require_relative './photo'
require_relative './slide'
require_relative './tag_directory'
require_relative './slideshow'

# photos = Parser.new('a_example.txt').photos
photos = Parser.new(ARGV[0]).photos
slides = []

v_photos = photos.select { |p| p.orientation == 'V' }

def optimal_photo(*photos)
  starting_photo = photos.first
  chosen_slide = nil
  chosen_slide_index = nil
  photos[1..11].each_with_index do |current_photo, index|
    current_slide = Slide.new(starting_photo, current_photo)
    # puts "#{current_slide.photos.map(&:id)} #{current_slide.self_score}"
    if current_slide.self_score == 0
      chosen_slide = current_slide 
      chosen_slide_index = index
      break
    elsif defined?(best_score) && current_slide.self_score < best_score
      chosen_slide = current_slide 
      chosen_slide_index = index
      best_score = current_slide.self_score
      next
    end
  end
  return [Slide.new(starting_photo), photos[1..].delete_at(chosen_slide_index)] unless chosen_slide
  return [chosen_slide, ( photos.reject { |photo| chosen_slide.photos.map(&:id).include? photo.id } )]
end

def recurse_optimal_photo(slideshow = [], photos = [])
  return slideshow if photos.nil? || photos.empty?
  # pp "slideshow/photos #{slideshow.count} #{photos.count}"
  slides = slideshow
  chosen_slide, remaining_photos = optimal_photo(*photos)
  # pp chosen_slide
  slides << chosen_slide
  recurse_optimal_photo(slides, remaining_photos)
end
# pp recurse_optimal_photo([], v_photos).map { |slide| slide.photos.map(&:id)}
# photos = Parser.new('a_example.txt').photos

slides << recurse_optimal_photo([], v_photos)

photos.each do |photo|
  slides << Slide.new(photo) if photo.orientation == 'H'
end

slides = slides.flatten

# tag_dir = TagDirectory.new

# photos.each do |photo|
#   tag_dir.add_slide(photo)
# end



# pp photos
# s = Slide.new(photos[1], photos[2])
# puts "s print #{s.print}"
# sa = Slide.new(photos[3])
# puts 's'
# pp s

Slideshow.new(slides).output

# puts 'sa'
# pp sa

# v_photos = photos.select { |p| p.orientation == 'V' }

# def optimal_photo(photos)
#   starting_photo = photos.first
#   best_score = 0
#   chosen_slide = nil
#   photos[1..].each do |current_photo|
#     current_slide = Slide.new(starting_photo, current_photo)
#     chosen_slide = current_slide if current_slide.score > best_score?
#   end
#   return chosen_slide
# end

# pp optimal_photo(v_photos)
