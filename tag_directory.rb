class TagDirectory
  attr_accessor :tags, :slides

  def initialize
    @tags = {}
    @slides = []
  end

  def add_slide(slide)
    slide.tags.each do |tag|
      @tags[tag] = [] if @tags[tag].nil?
      @tags[tag] << slide
    end
    @slides << slide
  end

  def remove_slide(slide)
    slide.tags.each do |tag|
      @tags[tag].delete(slide)
    end
    @slides.delete(slide)
  end

  def remove_tag(tag)
    @tags[tag].each do |slide|
      remove_slide slide
    end
    @tags[tag] = nil
  end
end
