class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :delivery_date, :target_languages, :description, :instructions, :reference_file, :source_file
  has_one :company
  has_one :user
  has_one :source_language
end
