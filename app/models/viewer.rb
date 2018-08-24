class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    @@all << self
  end

  # + `Viewer.all`
  #   + returns all of the viewers
  def self.all
    @@all
  end

  # + `Viewer#queue_items`
  #   + this method should return an array of `QueueItem` instances associated with this instance of `Viewer`.
  def queue_items
    QueueItem.all.select {|item| item.viewer == self}
  end

  # + `Viewer#queue_movies`
  #   + this method should return an array of `Movie` instances in the `Viewer`'s queue.
  def queue_movies
    self.queue_items.map {|item| item.movie}
  end

  # + `Viewer#add_movie_to_queue(movie)`
  #   + this method should receive a `Movie` instance as its only argument and add it to the `Viewer`'s queue
  def add_movie_to_queue(movie)
    queue = self.queue_items.map {|item| item}
    queue << movie
  end

  # + `Viewer#rate_movie(movie, rating)`
  #   + given a movie and a rating (a number between 1 and 5), this method should assign the rating to the viewer's `QueueItem` for that movie. If the movie is not already in the viewer's queue, this method should add a new `QueueItem` with the viewer, movie, and rating. If the movie is already in the queue, this method should not create a new `QueueItem`.
  def rate_movie(movie, rating)
    item = self.queue_items.select {|item| item.movie == movie}
    item.map {|item| item.rating = rating}
    if item == nil
      QueueItem.new(self, movie, rating)
    end
  end

end
