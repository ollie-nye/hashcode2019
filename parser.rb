require './photo.rb'

class Parser
  attr_accessor :file, :photos

  def initialize(filename)
    @file = File.open(filename, 'r')
    @photos = []
    @file.each_with_index do |line, index|
      next if line.split.length < 2
      @photos << Photo.new(line, index - 1)
    end
  end
end
