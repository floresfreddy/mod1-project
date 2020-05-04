class User < ActiveRecord::Base
    has_many :drinks, through: :favorites

    # def books
    #     Book.all.select{|book| book.author_id == self.id}
    # end

end