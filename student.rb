require_relative 'Person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom = 5, name: 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
