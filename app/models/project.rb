class Project < ApplicationRecord
  validates :name, presence: true, length: { :maximum => 200}
  validates :start_date, presence: true
  validates :delivery_date, presence: true
  validate :delivery_date_must_be_in_future, :start_date_validation, on: :create, on: :update
  validates :company, :description, :source_language, :subject_area, :source_file, :user, :target_languages,  presence: true
  belongs_to :company
  belongs_to :source_language
  belongs_to :user, counter_cache: true
  #User.find_each { |user| User.reset_counters(user.id, :projects) }  counter cache for old records
  belongs_to :subject_area

  has_many :project_target_languages
  has_many :target_languages, through: :project_target_languages, dependent: :destroy


  extend FriendlyId
  friendly_id :name, use: :slugged

  has_rich_text :description
  has_rich_text :instructions

  mount_uploader :source_file,    FileUploader
  mount_uploader :reference_file, FileUploader

  def to_s
    name
  end

  def start_date_validation
    if start_date.present? 
      if start_date < Date.today
        errors.add(:start_date, "must be in the future")
      end
      if start_date > delivery_date
        errors.add(:start_date, " cannot be after delivery date")
      end
    end
  end

  def delivery_date_must_be_in_future
    if delivery_date.present? && delivery_date < Date.today + 2
      errors.add(:delivery_date, "must be at least 2 days from today")
    end
  end

end
