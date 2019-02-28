class Slide
  attr_accessor :tags, :photos

  def initialize(*in_photos)
    raise 'too many photos' if in_photos.length > 2

    if in_photos.length > 1
      raise 'not matching orientation' unless in_photos[0].compatible_with(in_photos[1])
    end

    @photos << in_photos
    @photos.each do |photo|
      @tags << photo.tags
    end

    @tags = @tags.uniq
  end
end
