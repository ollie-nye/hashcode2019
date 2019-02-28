require_relative './parser'
require_relative './photo'
require_relative './slide'
require_relative './tag_directory'

photos = Parser.new('c_memorable_moments.txt').photos
v_photos = photos.select { |p| p.orientation == 'V' }

def optimal_photo(*photos)
  starting_photo = photos.first
  chosen_slide = nil
  photos[1..].each do |current_photo|
    current_slide = Slide.new(starting_photo, current_photo)
    puts "#{current_slide.photos.map(&:id)} #{current_slide.self_score}"
    if current_slide.self_score == 0
      chosen_slide = current_slide 
      puts "breaking"
      break
    elsif defined?(best_score) && current_slide.self_score < best_score
      chosen_slide = current_slide 
      best_score = current_slide.self_score
      next
    end
  end
  return [Slide.new(starting_photo), photos[1..].reject { |slide| slide == chosen_slide }] unless chosen_slide
  return [chosen_slide, ( photos[1..].reject { |slide| slide == chosen_slide } )]
end

def recurse_optimal_photo(slideshow = [], photos = [])
  return slideshow if photos.nil? || photos.empty?
  pp "slideshow/photos #{slideshow.count} #{photos.count}"
  slides = slideshow
  chosen_slide, remaining_photos = optimal_photo(*photos)
  pp chosen_slide
  slides << chosen_slide
  recurse_optimal_photo(slides, remaining_photos)
end
pp recurse_optimal_photo([], v_photos).map { |slide| slide.photos.map(&:id)}