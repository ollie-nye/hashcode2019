class Photo
  def initialize(input)
    values = input.split
    @orientation = values[0]
    @tags = values[2..]
  end
end
