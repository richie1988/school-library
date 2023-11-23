# teacher_spec.rb

require_relative '../modules/teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Test Teacher', 30, 'Test Specialization') }

  it 'should initialize with name, age, and specialization' do
    expect(teacher.name).to eq('Test Teacher')
    expect(teacher.age).to eq(30)
    expect(teacher.specialization).to eq('Test Specialization')
    expect(teacher.rentals).to be_empty
  end

  it 'should always be able to use the library' do
    expect(teacher.can_use_library?).to be(true)
  end
end
