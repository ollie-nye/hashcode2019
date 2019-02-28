class Photo
  attr_reader :tags, :orientation, :id

  def initialize(input, index)
    values = input.split
    @orientation = values[0]
    @tags = values[2..].map(&:to_sym)
    @id = index
  end

  def compatible_with(photo)
    self.orientation == photo.orientation
  end

end
