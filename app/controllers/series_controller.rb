class SeriesController < ApplicationController
  def index
    @series =Series.joins('LEFT JOIN reviews ON series.id = reviews.series_id')
      .select('series.*, avg(reviews.stars) as ratings')
      .group('series.id')
  end
end
