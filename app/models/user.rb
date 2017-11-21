class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable      
  belongs_to :institute_account, optional: true
  belongs_to :role, optional: true
  belongs_to :publisher, optional: true

  ROLE = ['SuperAdmin', 'Publisher', 'MemberPublisher', 'EndUser']

  ROLE.each do |role|
    define_method "is_#{role}?" do
    self.role.name == role
    end
  end
end
