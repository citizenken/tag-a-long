class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees

  geocoded_by :address
  after_validation :geocode
   
  validates :user_id, :presence => true, numericality: { only_integer: true }
  validates :title, :presence => true
  :description
  validates :address, :presence => true
  validates :time, :presence => true
  validates :count_members, :presence => true, numericality: { only_integer: true }
  validates :max_members, :presence => true, numericality: { only_integer: true }
  :latitude
  :longitude

end
