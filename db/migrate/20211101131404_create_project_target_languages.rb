class CreateProjectTargetLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :project_target_languages do |t|
      t.references :project, null: false, foreign_key: true
      t.references :target_language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
