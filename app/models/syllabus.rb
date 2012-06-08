class Syllabus < ActiveRecord::Base
  has_many :missions, :dependent => :destroy
  accepts_nested_attributes_for :missions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
