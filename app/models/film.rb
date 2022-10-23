class Film < ApplicationRecord  
    belongs_to :user
    has_many :favorites, dependent: :destroy
    belongs_to :genre

    with_options presence: true do
      validates :title
      validates :story
      validates :filmdirector
      validates :origin
      validates :releasedate
      validates :country
      validates :starring
    end
end

