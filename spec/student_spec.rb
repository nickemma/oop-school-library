require_relative('spec_helper')

describe Student do
  let(:student) { Student.new(20, 'John', 'Maths') }

  describe '#new' do
    it 'Takes three parameters and returns a Student object' do
      expect(student).to be_an_instance_of(Student)
    end
  end

  describe '#play_hooky' do
    it 'Returns the correct string' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
