class HomeController < ApplicationController
  require 'httparty'

  def index
    run = true
    while run
      response = HTTParty.get(get_nasa_apod_url).parsed_response
      @copyright = response['copyright']
      @url = response['url']
      run = false unless (@url.nil? || @url[0..3] != 'http')
    end
  end

  private

  def get_nasa_apod_url
    url = 'https://api.nasa.gov/planetary/apod?date='
    date = (Time.now - (60 * 60 * 24) * rand(365 * 5)).to_date.to_s
    api = "&api_key=#{ENV['nasa_api_key']}"
    url + date + api
  end
end