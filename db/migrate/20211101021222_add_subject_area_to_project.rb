class AddSubjectAreaToProject < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :subject_area, null: false, foreign_key: true
  end
end
