require_relative 'decorator'
# adding trim decolator
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable_obj.correct_name[0..9] if @nameable_obj.correct_name.length > 10
  end
end
