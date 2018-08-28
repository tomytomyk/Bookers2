class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :books

   attachment :profile_image

   validates :name, length: { in: 2..20 }
   validates :name, uniqueness: true
   validates :profile_body, length: { maximum: 50 }

end
