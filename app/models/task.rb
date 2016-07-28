class Task < ActiveRecord::Base
  validates :description, length: { minimum: 4 }

  def self.sort_priority_asc
    self.order({:sticky => :desc}, {priority: :desc})
  end

  def self.sort_priority_desc
    self.order({:sticky => :desc}, :priority)
  end

  def self.sort_description
    self.order({:sticky => :desc}, :description)
  end

  def self.sort_completion_date

    self.order({:sticky => :desc}, :completion_date)
  end


end
