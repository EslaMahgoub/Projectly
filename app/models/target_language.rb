class TargetLanguage < ApplicationRecord
  has_many :project_target_languages
  has_many :projects, through: :project_target_languages

  def to_s
    name
  end
end
