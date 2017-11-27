class Subscription < ApplicationRecord
	include Filterable
	#belongs_to :instituion_account
	has_many :subscription_books
	has_many :books_primary_content_informations, through: :subscription_books
	#has_many :subject_groups, through: :subscription_books
	has_many :subscription_institute
    has_many :instituition_accounts, through: :subscription_institute
end






