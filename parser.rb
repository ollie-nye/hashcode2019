require './photo.rb'

class Parser
  attr_accessor :file, :photos

  def initialize(filename)
    @file = File.open(filename, 'r')
    @photos = []
    @file.each do |line|
      next if line.split.length < 2
      @photos << Photo.new(line)
    end
  end
end
