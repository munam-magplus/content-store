module ApplicationHelper
	def publisher_name(pub)
		@publisher = Publisher.find_by_id(pub)
		@publisher = @publisher.publisher_name
	end
	def campaign_name(campaign_id)
		@campaign = Campaign.find_by_id(campaign_id)
		@campaign = @campaign.campaign_name
	end
	def publisher_names
		@publishers = Publisher.order('publisher_name').all
	end
	def country_name
		@country = Country.order('country_name').all
	end
end