require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'RMagick'

# 最初にアクセスした日時を cookie に保存、画像として返す
configure do
    mime_type :png, 'image/png'
end
get '/img' do 
    content_type :png
    response.set_cookie(:img, :value => Time.now.to_s + params[:plus], :expires => next_year) if cookies[:img].nil?
    text_image cookies[:img]
end

get '/img_js' do
    content_type :png
    response.set_cookie(:img_js, :value => Time.now.to_s + params[:plus], :expires => next_year) if cookies[:img_js].nil?
    text_image cookies[:img_js]
end

get '/js' do
    content_type :json
    response.headers["Access-Control-Allow-Origin"] = "http://crossdomain.com";
    response.headers["Access-Control-Allow-Credentials"] = 'true';
    response.set_cookie(:js, :value => Time.now.to_s, :expires => next_year) if cookies[:js].nil?    
    cookies.to_json
end

get '/cookies' do
    content_type :json
    response.headers["Access-Control-Allow-Origin"] = "http://crossdomain.com";
    response.headers["Access-Control-Allow-Credentials"] = 'true';
    cookies.to_json
end

def next_year
    Time.now + 3600*24*365
end

def text_image(text)
    img = Magick::Image.new(400, 100) { self.background_color = '#336699' }
    img.format = 'png'
    draw = Magick::Draw.new
    draw.annotate(img, 0, 0, 10, 30 , text) do
      self.font = 'Verdana-Bold'
      self.fill = '#FFFFFF'
      self.align = Magick::LeftAlign
      self.stroke = 'transparent'
      self.pointsize = 14
      self.text_antialias = true
      self.kerning = 1
    end
    img.to_blob
end
