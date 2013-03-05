class BlogPost < ActiveRecord::Base
  attr_accessible :body, :title, :likes
  belongs_to :owner, :class_name => 'User'
end
