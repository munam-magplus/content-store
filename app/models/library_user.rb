class LibraryUser < ApplicationRecord
	has_secure_password
	belongs_to :institution_account
end
