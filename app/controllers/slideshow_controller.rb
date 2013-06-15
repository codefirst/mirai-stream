require 'flickraw'

class SlideshowController < ApplicationController
  layout false
  def index
    sizes = %w(url_l url_c url_z url_n).freeze
    @photos = Keyword.where(user_id: current_user).map{|keyword|
      flickr.photos.search(text: keyword.keyword, extras: sizes.join(',')).to_a
    }.flatten.shuffle[0,10].map{|photo|
      begin
        # 2-nd lagrgest photo
        # (1st largeest is original, but it is so big)
        source = sizes.map{|s| photo[s]}.compact.first
        source ||= flickr.photos.getSizes(photo_id: photo['id'])[-2]['source']
      rescue
        []
      end
    }
  end
end
