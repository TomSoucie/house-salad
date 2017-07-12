class SearchController < ApplicationController
  def index
    binding.pry
    @members = curl "https://api.propublica.org/congress/v1/members/house/co/current.json" -H "X-API-Key: #{ENV[PROPUBLICA_API_KEY]}"
  end
end
