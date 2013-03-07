class NameExample < ActiveRecord::Migration
  def up
    user_dexter = User.create :email => 'dexter@rubyblog.com',
                              :password => 'dexter123',
                              :first_name => 'Dexter',
                              :last_name => 'Morgan'

    BlogPost.create :title => 'Using Ruby at criminalistic work',
                    :body  => 'Coming soon',
                    :owner => user_dexter,
                    :category_id => 4,
                    :likes => 4
  end

  def down
  end
end
