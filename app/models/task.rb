class Task < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings

  validates :description, length: { minimum: 4 }
  validate :completion_date_cannot_be_in_the_past

  def tag_list=(list)
    names = list.split(',').map { |s| s.strip.downcase }.uniq
    self.tags = names.map { |name| Tag.find_or_create_by(name: name) }
  end

  def tag_list
    self.tags.each { |tag| tag.name }.join(', ')
  end

  def self.list(order)
    order('sticky DESC', order)
  end

  def completion_date_cannot_be_in_the_past
    if completion_date.present? && completion_date < Date.today
      errors.add(:completion_date, "can't be in the past")
    end
  end
end
