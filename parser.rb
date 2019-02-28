require './photo.rb'

class Parser
  attr_accessor :file, :number_of_photos, :photos

  def initialize(filename)
    first = true
    @file = File.open(filename, 'r')
    @photos = []
    @file.each do |line|
      if first
        @number_of_photos = line
        first = false
      end
      @photos << Photo.new(line)
    end
  end
end
