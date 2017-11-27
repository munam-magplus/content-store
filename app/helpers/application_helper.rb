module ApplicationHelper
	def publisher_name(publisher_id)
		publisher = Publisher.find_by_id(publisher_id)
		@publisher = publisher.publisher_name
	end
	def campaign_name(campaign_id)
		campaign = Campaign.find_by_id(campaign_id)
		@campaign = campaign.campaign_name
	end
	def publisher_names
		@publishers = Publisher.order('publisher_name').all
	end

	def subscription_names
		@subscriptions = Subscription.order('subscription_name').all
	end
	
	def country 
		@country = Country.order('country_name').all
	end
	def country_name(country_code)
 		@country_name = Country.find_by_country_code(country_code).country_name		
	end

	def page_entries_info(collection, options = {})
      if collection.total_pages > 0
       %{Results %d - %d of %d} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
        ]
      end
    end  
end
