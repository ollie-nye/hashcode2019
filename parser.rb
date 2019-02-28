class Parser
  attr_accessor :file, :number_of_photos

  def initialize(filename)
    @file = File.open(filename, 'r')
    @number_of_photos = file.gets
  end

  
end
