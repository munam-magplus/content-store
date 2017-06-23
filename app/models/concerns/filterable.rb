module Filterable
  def self.included( base )
    base.extend ClassMethods
  end
  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil) # to get all the data from model
      cond = "true" # default condition
      filtering_params.each do |key, value|
        if key == "from"
          cond << " AND created_at >=?" if value.present?
        end
        if key == "to"
          cond << " AND created_at <=?" if value.present?
        end
        if key == "publication_date"
          cond << " AND extract(year from publication_date) = ?" if value.present?
        end
        if key != "from" && key != "to" && key != "publication_date"
          # if key's value is present only then key will be added to cond
          cond << " AND #{key} LIKE ?" if value.present?
        end
      end
      filtering_params.each do |key, value|
        # if key's value is present only then value will be added to cond
        if key == "publication_date"
          cond << ",""#{value}" if value.present? 
        else
          cond << ",""%#{value}%" if value.present?
        end 
      end
      # to split string into conditions
      conditions = cond.split(',')
      results = results.where(conditions)
    end
  end
end