require 'rspec'
require_relative '../modules/rental'
require_relative '../modules/book'
require_relative '../modules/person'

describe Rental do
  let(:date) { '2023-11-15' }
  let(:book) { instance_double('Book') }
  let(:person) { instance_double('Person') }
  subject { described_class.new(date, book, person) }

  describe '#initialize' do
    it 'should initialize with date, book, and person' do
      allow(book).to receive(:add_rental)
      allow(person).to receive(:add_rental)

      expect { subject }.not_to raise_error

      expect(book).to have_received(:add_rental).with(subject)
      expect(person).to have_received(:add_rental).with(subject)
    end
  end
end
