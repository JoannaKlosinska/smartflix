# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    id { 1 }
    title { 'Batman' }
    year { 1989 }
    rated { 'PG-13' }
    released { '23 Jun 1989' }
    runtime { '126 min' }
    genre { 'Action, Adventure' }
    director { 'Tim Burton' }
    writer { 'Bob Kane, Sam Hamm, Warren Skaaren' }
    actors { 'Michael Keaton, Jack Nicholson, Kim Basinger' }
    plot do
      'The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier,
      a criminal who becomes the clownishly homicidal Joker.'
    end
    language { 'English, French, Spanish' }
    country { 'United States, United Kingdom' }
    awards { 'Won 1 Oscar. 9 wins & 26 nominations total' }
    poster { 'https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg' }
    ratings do
      '[{\"Source\"=>\"Internet Movie Database\",
      \"Value\"=>\"7.5/10\"},
      {\"Source\"=>\"Rotten Tomatoes\",
        \"Value\"=>\"71%\"}, {\"Source\"=>\"Metacritic\",
        \"Value\"=>\"69/100\"}]'
    end
    metascore { '69' }
    imdb_rating { '7.5' }
    imdb_votes { '351,618' }
    imdb_id { 'tt0096895' }
    type { nil }
    dvd { '22 Aug 1997' }
    box_office { '$251,348,343' }
    production { 'Warner Brothers, PolyGram Filmed Entertainment, Guber-Peters Company' }
    website { 'N/A' }
    response { 'True' }
    total_seasons { nil }
  end
end
