class Drink < ActiveRecord::Base
    has_many :recipies
    has_many :ingredients, through: :recipies

    # def reviews
    #     Review.all.select{|review| review.bakery_id == self.id}
    # end

    # def customers
    #     reviews.map{|review| review.customer_id}
    # end

end