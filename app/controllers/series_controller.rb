class SeriesController < ApplicationController
  def index
    @series = Series.joins(:actors).
      joins('LEFT JOIN reviews ON series.id = reviews.series_id').
      select('series.*, avg(reviews.stars) as ratings, GROUP_CONCAT(DISTINCT(actors.name)) as actor_names').
      group('series.id')
  end
end
