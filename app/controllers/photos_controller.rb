class PhotosController < ApplicationController
  def index
    base_url = 'https://api.500px.com'
    popular_url = '/v1/photos?feature=popular&sort=created_at&rpp=100&image_size=4&include_store=store_download&include_states=voted'

    consumer_key = session[:consumer_key]
    token = session[:oauth_token]
    token_secret = session[:token_secret]

    client = F00px::Client.new
    client.consumer_key = configatron.consumer_key
    client.consumer_secret = configatron.consumer_secret
    client.token = token
    client.token_secret = token_secret


    response = client.get("#{base_url}#{popular_url}#{consumer_key}")
    body = JSON.parse(response.body)
    @photos = []
    body["photos"].each do |photo|
      @photos << [photo["image_url"]]
      @photos.last << photo["id"]
    end
  end

  def like

    consumer_key = session[:consumer_key]
    token = session[:oauth_token]
    token_secret = session[:token_secret]

    client = F00px::Client.new
    client.consumer_key = configatron.consumer_key
    client.consumer_secret = configatron.consumer_secret
    client.token = token
    client.token_secret = token_secret

    photo_id = params[:id]

    response = client.post("photos/#{photo_id}/vote?vote=1")
    redirect_to :back
  end

  def show

    consumer_key = session[:consumer_key]
    token = session[:oauth_token]
    token_secret = session[:token_secret]

    client = F00px::Client.new
    client.consumer_key = configatron.consumer_key
    client.consumer_secret = configatron.consumer_secret
    client.token = token
    client.token_secret = token_secret

    photo_id = params[:id]
    response = client.get("https://api.500px.com/v1/photos/#{photo_id}?image_size=3&comments=1")
    body = JSON.parse(response.body)
    @photo = body['photo']
  end
end
