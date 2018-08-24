class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  # + `Movie.all`
  #   + returns an array of all `Movies`
  def self.all
    @@all
  end

  # + `Movie#queue_items`
  #   + returns an array of all the `QueueItem` instances that contain this movie
  def queue_items
    QueueItem.all.select {|item| item.movie == self}
  end

  # + `Movie#viewers`
  #   + returns an array of all of the `Viewer`s with this `Movie` instance in their queue
  def viewers
    self.queue_items.map {|item| item.viewer}
  end

  # + `Movie#average_rating`
  #   + returns the average of all ratings for this instance of `Movie`
  def average_rating
    sum = self.queue_items.map {|item| item.rating}.reduce(:+)
    length = self.queue_items.length
    sum / length
  end

  # + `Movie.highest_rated`
  #   + returns the instance of `Movie` with the highest average rating
  def self.highest_rated
    QueueItem.all.max_by {|item| item.movie.average_rating}
  end
end
