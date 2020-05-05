class Drink < ActiveRecord::Base
    has_many :recipes
    has_many :ingredients, through: :recipes

    # def reviews
    #     Review.all.select{|review| review.bakery_id == self.id}
    # end

    # def customers
    #     reviews.map{|review| review.customer_id}
    # end

end