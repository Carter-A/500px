class PhotosController < ApplicationController
  def index
    base_url = 'https://api.500px.com'
    popular_url = '/v1/photos?feature=popular&sort=created_at&rpp=100&image_size=3&include_store=store_download&include_states=voted'
    consumer_key = configatron.consumer_key
    response = HTTParty.get("#{base_url}#{popular_url}#{consumer_key}")
    body = JSON.parse(response.body)
    @photos_url = []
    body["photos"].each do |photo|
      @photos_url << photo["image_url"]
    end
  end
end
