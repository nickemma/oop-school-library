require_relative('spec_helper')

describe Book do
  before :each do
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  end

  context 'Book' do
    it 'should have a title' do
      expect(@book.title).to eql('The Hobbit')
    end
    it 'should have an author' do
      expect(@book.author).to eql('J.R.R. Tolkien')
    end
  end
end
