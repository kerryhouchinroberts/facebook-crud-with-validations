class Status < ActiveRecord::Base

  validates :status_message, presence: true
  validates :user, presence: true

end
