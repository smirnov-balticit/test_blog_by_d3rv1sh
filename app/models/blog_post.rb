class BlogPost < ActiveRecord::Base
  attr_accessible :body, :title, :likes, :owner, :category, :category_id
  belongs_to :owner, :class_name => 'User'
  belongs_to :category, :class_name => 'Category'

  validates_presence_of :category
  validates_presence_of :owner
  validates_presence_of :title
  validates_presence_of :body
end
