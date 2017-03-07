class User < ApplicationRecord
<<<<<<< HEAD
	validates :email, presence: true
	validates :encrypted_password, presence: true
end
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
>>>>>>> e19792cb2383f4529f90fb24c1aafe41939e61e1
