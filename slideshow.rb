class Slideshow
  attr_accessor :slide_count, :slides

  def initialize(in_slides)
    @slides = []
    @slide_count = 1

    @slides << in_slides.delete_at(0)
    available_slides = in_slides
    while available_slides.count.positive?
      available_slides = order(available_slides.first, available_slides)
    end

    output
  end

  def order(start, available_slides)
    next_slide_index = find_next_slide(start, available_slides)
    next_slide = available_slides[next_slide_index]
    @slides << next_slide
    @slide_count += 1
    puts "#{available_slides.count} remaining"
    available_slides.delete_at(next_slide_index)
    available_slides
  end

  def find_next_slide(slide, available_slides)
    best_score = 0
    best_slide = nil
    available_slides[0..5].each_with_index do |check_slide, index|
      score = slide.score check_slide
      best_slide = index if score > best_score
    end
    best_slide = 0 if best_slide == nil
    best_slide
  end

  def output
    file = File.open('out.txt', 'w')
    file.puts @slide_count
    @slides.each do |slide|
      file.puts slide.print
    end
  end
end
