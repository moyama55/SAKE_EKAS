class AlcoolComment < ApplicationRecord
  belongs_to :user
  belongs_to :alchool, optional: true
end
