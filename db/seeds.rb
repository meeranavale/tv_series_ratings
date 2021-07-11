# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

# Load TV Series
# This will create associated Actor, Location records also
CSV.foreach(Rails.root.join('lib/seed_csv/tv_series.csv'), headers: true) do |row|
  actor = Actor.where(
    name: row['Actor']
  ).first_or_create

  location = Location.where(
    city: row['Shoot location'],
    country: row['Country']
  ).first_or_create
  
  series = Series.where(
    name: row['TV Series'],
    genre: row['Genre'],
    no_of_seasons: row['No of seasons'],
    date_of_first_release: row['Date of First Release'],
    director: row['Director']
  ).first_or_create

  # Create associated records
  series.locations << location
  series.actors << actor
end

# Load Reviews
CSV.foreach(Rails.root.join('lib/seed_csv/reviews.csv'), headers: true) do |row|  
  series = Series.where(
    name: row['TV Series'],
  ).first

  location = Review.where(
    user: row['User'],
    stars: row['Stars'],
    review: row['Review'],
    series_id: series.id
  ).first_or_create
end

