class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :delivery_date
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :source_language, null: false, foreign_key: true
      t.text :description
      t.text :instructions
      t.string :reference_file
      t.string :source_file

      t.timestamps
    end
  end
end
