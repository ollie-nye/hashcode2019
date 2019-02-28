class Slideshow
  attr_accessor :slide_count, :slides

  def initialize(in_slides)
    @slides = []
    @slide_count = 1

    @slides << in_slides.first
    order(in_slides.first, in_slides.reject { |s| s == in_slides.first })

    output
  end

  def order(start, available_slides)
    next_slide = find_next_slide(start, available_slides)
    @slides << next_slide
    @slide_count += 1
    order(next_slide, available_slides.reject { |s| s == next_slide }) unless available_slides.count < 2
  end

  def find_next_slide(slide, available_slides)
    best_score = 0
    best_slide = nil
    available_slides.each do |check_slide|
      score = slide.score check_slide
      best_slide = check_slide if score > best_score
    end
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
