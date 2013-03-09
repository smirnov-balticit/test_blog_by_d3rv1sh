class BigPopulate < ActiveRecord::Migration
  def up
    # Users

    user_alex    = User.create :email => 'alex@rubyblog.com',
                               :password => 'alex123'

    user_bella   = User.create :email => 'bella@rubyblog.com',
                               :password => 'bella123'

    user_fedor   = User.create :email => 'fedor@rubyblog.com',
                               :password => 'fedor123'

    # Categories
    cat_mood =  Category.create :name => 'For good mood'
                Category.create :name => 'Funny ruby stuff'
                Category.create :name => 'Rails framework'
                Category.create :name => 'Video and audio'
                Category.create :name => 'Making things going'
    cat_div42 = Category.create :name => 'How to divide 42 by 0'

    # Posts
    BlogPost.create :title => 'Why Ruby-skilled girls are hot',
                    :body  => 'Ruby is really fancy programming language.
                               So fancy like something able to make every girl more sexy.
                               Also Ruby is the great option as tale before midnight.',
                    :owner => user_alex,
                    :category => cat_mood,
                    :likes => 11

    BlogPost.create :title => 'CoffeeScript is great',
                    :body  => 'That language with awesome syntax is good mate for JavaScript.
                               You can unleash whole power of JavaScript in a more clean way.
                               Happy scripting!',
                    :owner => user_bella,
                    :category => cat_div42,
                    :likes => 3

    BlogPost.create :title => 'Lorem ipsum',
                    :body  => 'This is absolute useless post just as dummy placeholder.',
                    :owner => user_fedor,
                    :category => cat_mood,
                    :likes => 0
  end

  def down
  end
end
