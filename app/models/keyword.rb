class Keyword < ActiveRecord::Base
  belogns_to :user
  attr_accessible :keyword
end
