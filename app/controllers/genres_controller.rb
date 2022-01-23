class GenresController < ApplicationController
    has_many :alchool_genres, dependent: :destroy
    has_many :alchools, through: :alchool_genres
    validates :name, presence: true
end
