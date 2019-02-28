class Slideshow
  attr_accessor :slide_count, :slides

  def initialize(slides)

  end

  def place_slide(slide)
    
  end

  def output
    file = File.open('out.txt', 'w')
    file.puts @slide_count
    @slides.each do |slide|
      slide.print
  end
end
