require 'flickraw'

class SlideshowController < ApplicationController
  layout false
  def index
    sizes = %w(url_l url_c url_z url_n).freeze
    extras = (sizes + %w(description geo tags)).join(',').freeze
    @photos = Keyword.where(user_id: current_user).map{|keyword|
      cache_key = "photos_keyword_#{keyword.keyword}"
      cached = Rails.cache.read(cache_key)
      #p "cached for #{keyword.keyword}: #{cached}"
      if (cached.nil? or
          [:photos, :cached_at].any?{|k| !cached.key?(k)} or
          Time.now - cached[:cached_at] > 10 * 60)
        flickr.photos.search(text: keyword.keyword, extras: extras).to_a.tap do |photos|
          Rails.cache.write(cache_key, {:photos => photos, :cached_at => Time.now})
        end
      else
        cached[:photos]
      end
    }.flatten.shuffle[0,10].map{|photo|
      begin
        # 2-nd lagrgest photo
        # (1st largeest is original, but it is so big)
        p photo
        source = sizes.map{|s| photo[s]}.compact.first
        source ||= flickr.photos.getSizes(photo_id: photo['id'])[-2]['source']
        {
          :source => source,
          :title => photo['title'],
          :tags => photo['tags'].split,
          :description => photo['description'],
          :latitude => photo['latitude'],
          :longitude => photo['longitude'],
        }
      rescue
        []
      end
    }
  end
end
