class Photo
  attr_reader :tags, :orientation, :id

  def initialize(input, index)
    values = input.split
    @orientation = values[0]
    @tags = values[2..]
    @id = index
  end

  def tags_shared_with(photo)
    (self.tags & photo.tags).size
  end

  def tags_different_from(photo)
    [(self.tags - photo.tags).size, (photo.tags - self.tags).size].min
  end

  def compatible_with(photo)
    self.orientation == photo.orientation
  end
end
