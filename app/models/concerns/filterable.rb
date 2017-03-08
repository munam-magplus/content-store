module Filterable
  def self.included( base )
    base.extend ClassMethods
  end
  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil) # to get all the dtata from model
      cond = "#{self.column_names.first} > 0" # default condition
      filtering_params.each do |key, value|
        # if key's value is present only then key will be added to cond
        cond << " AND #{key} LIKE ?" if value.present?
      end
      filtering_params.each do |key, value|
        # if key's value is present only then value will be added to cond
        cond << ",""#{value}" if value.present? 
      end
      # to split string into conditions
      conditions = cond.split(',')
      results = results.where(conditions)
    end
  end
end
