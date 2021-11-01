class ProjectTargetLanguage < ApplicationRecord
  belongs_to :project
  belongs_to :target_language

  # validates :project, :target_language, presence: true
  
  validates_uniqueness_of :project_id, scope: :target_language_id 
  validates_uniqueness_of :target_language_id, scope: :project_id 
end