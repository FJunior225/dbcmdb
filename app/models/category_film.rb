class CategoryFilm < ActiveRecord::Base
belongs_to :film
belongs_to :category
end