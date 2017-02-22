module Filterable
  def self.included( base )
    base.extend ClassMethods
  end
  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      cond = "#{self.column_names.first} > 0" #some default condition
      filtering_params.each do |key, value|
        cond << " AND #{key} LIKE ?" if value.present?
      end
      filtering_params.each do |key, value|
        cond << ",""#{value}" if value.present?
      end
      conditions = cond.split(',')
      results = results.where(conditions)
    end
  end
end
