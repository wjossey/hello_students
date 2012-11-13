class Student < ActiveRecord::Base
  validates_presence_of :name, :state

  state_machine :initial => :absent do
    event :raises_hand do
      transition :absent => :in_attendance
    end
    
    event :stays_silent do
      transition :in_attendance => :absent
    end
  end

  #Return all the students who are in_attendance of the class
  def self.good_students
    Student.where("state = 'in_attendance'")
  end
end
