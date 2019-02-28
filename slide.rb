class Slide
  attr_accessor :tags, :photos

  def initialize(*in_photos)
    raise 'too many photos' if in_photos.length > 2

    @tags = []
    @photos = []

    if in_photos.length > 1
      raise 'not matching orientation' unless in_photos[0].compatible_with(in_photos[1])
    end

    @photos = in_photos
    @photos.each do |photo|
      @tags << photo.tags
    end

    @tags = @tags.flatten.uniq
  end

  def tags_shared_with(slide)
    (self.tags & slide.tags).size
  end

  def tags_different_from(slide)
    [(self.tags - slide.tags).size, (slide.tags - self.tags).size].min
  end

  def score(slide)
    [tags_shared_with(slide), tags_different_from(slide)].min
  end
end
