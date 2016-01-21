class Post < ActiveRecord::Base
  validates :title, :length => {:minimum => 5}
  
end
