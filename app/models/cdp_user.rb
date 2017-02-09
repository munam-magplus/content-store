class CdpUser < ApplicationRecord
	self.table_name = "CDP_USER"
	validates :USE_USER_TYPE, presence: true
	validates :CREATED_BY, presence: true
	validates :LASTUPDATED_BY, presence: true
	validates :USE_USER_NAME, presence: true
	validates :USE_LAST_NAME, presence: true
	validates :PUY_PUBLISHER_COUNTRY_ID, presence: true
	validates :USE_EMAIL, presence: true, email: true
	validates :USE_USER_PASS, presence: true
end