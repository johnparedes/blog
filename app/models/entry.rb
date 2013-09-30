class Entry < ActiveRecord::Base
  belongs_to :user
  image_accessor :entry_image
end
