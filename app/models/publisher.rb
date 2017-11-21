class Publisher < ApplicationRecord
	include Filterable #search module
  #used for uploading image
  has_attached_file :publisher_logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :publisher_logo, content_type: /\Aimage\/.*\z/
  # Associations
  has_many :books_primary_content_informations, dependent: :destroy
  has_many :subject_groups
  has_many :subjects
  has_many :users
  accepts_nested_attributes_for :users

	# Validations
  #-----------------------------------------------------------------------------
	  validates_presence_of :publisher_name, :publisher_code, :publisher_type,
  	 :contact_first_name, :contact_last_name, :contact_email
  #-----------------------------------------------------------------------------
end
