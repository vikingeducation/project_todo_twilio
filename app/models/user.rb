class User < ActiveRecord::Base
  validates :name, presence: true
  validates_format_of :number, with: /\+\d{11}/
end
