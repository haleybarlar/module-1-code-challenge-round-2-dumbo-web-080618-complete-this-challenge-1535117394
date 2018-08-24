require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

movie1 = Movie.new("A movie")
movie2 = Movie.new("Another movie")
movie3 = Movie.new("Spice World")

joy = Viewer.new("joy123")
vadim = Viewer.new("vadim123")
haley = Viewer.new("haley123")

item1 = QueueItem.new(joy, movie1, 1)
item2 = QueueItem.new(vadim, movie1, 2)
item3 = QueueItem.new(haley, movie1, 5)
item3 = QueueItem.new(haley, movie2, 5)
item3 = QueueItem.new(haley, movie3, 5)
item3 = QueueItem.new(haley, movie3, 5)
item3 = QueueItem.new(haley, movie3, 5)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line
