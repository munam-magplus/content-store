module ApplicationHelper
	def publisher_name(pub)
		@publisher = Publisher.find_by_id(pub)
	end
	def country_name
		@country = Country.order('country_name').all
	end
end