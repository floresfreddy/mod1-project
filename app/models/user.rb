class User < ActiveRecord::Base
    has_many :favorites
    has_many :recipes, through: :favorites

    # def books
    #     Book.all.select{|book| book.author_id == self.id}
    # end

end