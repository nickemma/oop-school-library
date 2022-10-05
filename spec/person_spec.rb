require_relative('spec_helper')

describe Person do
  let(:person) { Person.new(20, 'John') }

  describe '#new' do
    it 'Takes two parameters and returns a Person object' do
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '#name' do
    it 'Returns the correct name' do
      expect(person.name).to eq('John')
    end
  end

  describe '#age' do
    it 'Returns the correct age' do
      expect(person.age).to eq(20)
    end
  end

  describe '#rentals' do
    it 'Returns an empty array' do
      expect(person.rentals).to eq([])
    end
  end
end
