class Alchool < ApplicationRecord
 belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :alcool_comments, dependent: :destroy
 has_many :alchool_genres
 has_many :genres, through: :alchool_genres

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

  def self.search_for(content, method)
   if method == 'perfect'
     Alchool.where(title: content)
   elsif method == 'forward'
     Alchool.where('title LIKE ?', content + '%')
   elsif method == 'backward'
     Alchool.where('title LIKE ?', '%' + content)
   else
    Alchool.where('title LIKE ?', '%' + content + '%')
   end
  end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
