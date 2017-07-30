class Node
  attr_reader :title, :rating
  attr_accessor :left, :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end
end
