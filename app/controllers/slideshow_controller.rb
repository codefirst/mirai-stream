require 'flickraw'

class SlideshowController < ApplicationController
  layout false
  def index
    @photos = Keyword.where(user_id: current_user).map{|keyword|
      flickr.photos.search(text: keyword.keyword).to_a
    }.flatten.shuffle[0,10].map{|photo|
      begin
        # 2-nd lagrgest photo
        # (1st largeest is original, but it is so big)
        x = flickr.photos.getSizes(photo_id: photo['id'])[-2]
        x['source']
      rescue
        []
      end
    }
  end
end
