class Drink < ActiveRecord::Base
<<<<<<< HEAD:app/models/drink.rb
    has_many :recipies
    has_many :ingredients, through: :recipies
=======
    has_many :recipes
    has_many :ingredients, through: :recipes
>>>>>>> yannickdjoumbi:app/models/drink.rb

    # def reviews
    #     Review.all.select{|review| review.bakery_id == self.id}
    # end

    # def customers
    #     reviews.map{|review| review.customer_id}
    # end

end