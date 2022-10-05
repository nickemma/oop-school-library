require_relative 'decorator'
# adding capitalize decolator class
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable_obj.correct_name.capitalize
  end
end