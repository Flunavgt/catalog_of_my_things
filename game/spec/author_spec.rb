require_relative '../author'

describe 'Author' do
  it 'should be able to be created' do
    author = Author.new('John', 'Doe')
    expect(author).to be_a(Author)
  end

  it 'should be able to be created with a first name' do
    author = Author.new('John', 'Doe')
    expect(author.first_name).to eq('John')
  end

  it 'should be able to be created with a last name' do
    author = Author.new('John', 'Doe')
    expect(author.last_name).to eq('Doe')
  end

  it 'sjould be created as a list' do
    author = Author.new('John', 'Doe')
    author.add_list({ first_name: 'John', last_name: 'Doe' })
    expect(author.items).to eq([{ first_name: 'John', last_name: 'Doe' }])
  end

  it 'should remove author from  list' do
    author = Author.new('John', 'Doe')
    author.add_list({ first_name: 'John', last_name: 'Doe' })
    expect(author.items).to eq([{ first_name: 'John', last_name: 'Doe' }])
  end
end
