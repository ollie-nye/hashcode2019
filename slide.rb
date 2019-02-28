class Slide
  attr_accessor :tags, :photos

  def initialize(*in_photos)
    raise 'too many photos' if in_photos.length > 2

    if in_photos.length > 1
      raise 'not matching orientation' if in_photos[0].orientation != in_photos[1].orientation
    end

    @photos << in_photos
    @photos.each do |photo|
      @tags << photo.tags
    end

    @tags = @tags.uniq
  end
end
