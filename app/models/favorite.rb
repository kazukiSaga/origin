class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :film

    validates_uniqueness_of :film_id, scope: :user_id
end
