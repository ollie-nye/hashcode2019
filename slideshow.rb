class Slideshow
  attr_accessor :slide_count, :slides

  def initialize(in_slides)
    @slides = []
    @slide_count = 1

    @slides << in_slides.delete_at(0)
    # order(in_slides.first, in_slides.reject { |s| s == in_slides.first })

    @available_slides = in_slides
    while @available_slides.count > 2
      order(@slides.last)
    end

    output
  end

  def order(start)
    next_slide_index = find_next_slide(start)
    next_slide = @available_slides[next_slide_index]
    @slides << next_slide
    @slide_count += 1
    puts "#{@available_slides.count} remaining"
    # order(next_slide, available_slides.delete_at(next_slide_index)) unless available_slides.count < 2
    @available_slides.delete_at(next_slide_index)
  end

  def find_next_slide(slide)
    best_score = 0
    best_slide = nil
    @available_slides[0..5].each_with_index do |check_slide, index|
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
