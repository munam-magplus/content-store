class AddSubjectClassificationToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :subject_classification, :string
  end
end
