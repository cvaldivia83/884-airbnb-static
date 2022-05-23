require "json"
require "open-uri"

class FlatsController < ApplicationController
  def flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    user_serialized = URI.open(url).read
    @flats = JSON.parse(user_serialized)
  end

  def show
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    user_serialized = URI.open(url).read
    flats = JSON.parse(user_serialized)
    @flat = flats.select { |flat| flat["id"] == params[:flat_id].to_i}
  end
end
