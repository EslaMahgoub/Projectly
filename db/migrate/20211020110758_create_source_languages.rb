class CreateSourceLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :source_languages do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
