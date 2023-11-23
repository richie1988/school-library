require_relative '../decorator/capitalizedeco'
require 'rspec'

describe Capitalized do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the result of correct_name on the nameable' do
      allow(nameable).to receive(:correct_name).and_return('john')
      expect(subject.correct_name).to eq('John')
    end
  end
end
