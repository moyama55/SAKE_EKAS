class Genre < ApplicationRecord
  has_many :alchool_genres
  has_many :alchools, through: :alchool_genres
end
