class Publisher < ApplicationRecord
	include Filterable #search module
  #used for uploading image
  has_attached_file :publisher_logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :publisher_logo, content_type: /\Aimage\/.*\z/
  # Associations
  has_many :books_primary_content_informations, dependent: :destroy
  has_many :subject_groups
	# Validations
  #-----------------------------------------------------------------------------
	  validates_presence_of :publisher_name
  	validates_presence_of :publisher_code
  	validates_presence_of :publisher_type
  	validates_presence_of :contact_first_name
  	validates_presence_of :contact_last_name
  	validates_presence_of :contact_email
  #-----------------------------------------------------------------------------
end
