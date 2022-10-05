require_relative('spec_helper')

describe Teacher do
  it 'Should match all attributes' do
    teacher = Teacher.new(44, :Biology, 'Martin',)
    expect(teacher.can_use_services?).to be_truthy
    expect(teacher.specialization).to eq(:Biology)
    expect(teacher.name).to eq('Martin')
  end
end