require 'rspec'
require_relative '../modules/book'

describe Book do
  let(:book_title) { 'Goodbye, Dieting' }
  let(:book_author) { 'Nawoon Im' }
  let(:book) { Book.new(book_title, book_author) }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      rental = instance_double('Rental')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
