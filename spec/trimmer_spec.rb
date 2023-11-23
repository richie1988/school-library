require_relative '../decorator/trimmerdeco'
require 'rspec'

describe Trimmer do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'trims the result of correct_name on the nameable' do
      allow(nameable).to receive(:correct_name).and_return('abcdefghijlongname')
      expect(subject.correct_name).to eq('abcdefghij')
    end
  end
end
