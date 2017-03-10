class BookContent < ApplicationRecord
	attr_accessor :primary_content_info, :contributors, :content_pricing, :content_access_rules, :seo_config
	attr_writer :current_step

	def current_step
		@current_step || steps.first
	end

	def steps
		%w[primary_content_info contributors content_pricing content_access_rules seo_config]
	end

	def next_step
		self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
		current_step == steps.first
	end
end