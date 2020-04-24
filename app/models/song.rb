class Song < ApplicationRecord
    def released?
        true if released 
    end 

    validates :title, uniqueness: true 
    validates :title, presence: true
    with_options if: :released? do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year }
    end
end 
