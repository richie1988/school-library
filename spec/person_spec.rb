require 'rspec'
require_relative '../modules/person'

describe Person do
  let(:person) { Person.new('Mary Sue', 25, parent_permission: true) }

  it 'creates a new person with a random ID, name, age, and rentals array' do
    expect(person.name).to eq('Mary Sue')
    expect(person.age).to eq(25)
    expect(person.rentals).to be_empty
    expect(person.id).to be_a(Integer)
  end

  it 'returns the correct name of the person' do
    expect(person.correct_name).to eq('Mary Sue')
  end

  it 'checks if the person can use the library' do
    expect(person.can_use_library?).to be true
  end

  it 'adds a rental to the person\'s rental history' do
    rental = instance_double('Rental')
    person.add_rental(rental)
    expect(person.rentals).to include(rental)
  end
end
