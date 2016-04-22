require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'httparty'
require 'pg'

def sql_string(value)
  # Rick being stupid
  # "'#{value}.to_s.gsub("'", "''")'"
  "'#{value.to_s.gsub("'", "''")}'"
end

get '/' do 
  @title = params[:title]

  if @title && @title > ""
    url = "http://www.omdbapi.com/?t=#{@title.split.join('+')}"
    @search_results = HTTParty.get(url)

    @db = PG.connect(dbname: 'movie_app', host: 'localhost')
    sql = "INSERT INTO movies (
      title, 
      poster, 
      plot, 
      year) VALUES (
      #{sql_string(@search_results['Title'])}, 
      #{sql_string(@search_results['Poster'])}, 
      #{sql_string(@search_results['Plot'])}, 
      #{@search_results['Year'].to_i})"
    @db.exec(sql)
    @db.close
  end
  erb :movie
end

get '/movies' do 
  @db = PG.connect(dbname: 'movie_app', host: 'localhost')
  sql = "SELECT * FROM movies"
  @movies = @db.exec(sql)
  @db.close

  erb :movies
end









