class AddSubjectPriorityToSubjects < ActiveRecord::Migration[5.0]
  
  def change
  	add_column :subjects, :subject_priority, :integer
  end
  
end
