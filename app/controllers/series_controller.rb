class SeriesController < ApplicationController
  def index    
    @series = Series.joins(:actors)
        .joins('LEFT JOIN reviews ON series.id = reviews.series_id')
        .select('series.*, avg(reviews.stars) as ratings, GROUP_CONCAT(DISTINCT(actors.name)) as actor_names')
        .group('series.id')

    # When search string is present then filter actors matching to search string
    if params[:search].present?
      @series = @series
        .joins('INNER JOIN "actors_series" act_ser ON "act_ser"."series_id" = "series"."id"
          INNER JOIN "actors" act ON "act"."id" = "act_ser"."actor_id"')
        .where("actors.name LIKE ?", "%#{params[:search]}%")
        .select('series.*, avg(reviews.stars) as ratings, GROUP_CONCAT(DISTINCT(act.name)) as actor_names')
    end
  end
end
