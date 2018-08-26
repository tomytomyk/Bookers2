class Book < ApplicationRecord

	belongs_to :user

	attachment :profile_image

    validates :title, presence: true
    validates :body, length: { in: 1..200 }

end
