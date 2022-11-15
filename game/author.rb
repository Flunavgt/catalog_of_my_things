class Author
  attr_accessor :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id: nil)
    @id = Random.rand(1..1000) || id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_list(item)
    @items << item
  end

  def remove_list(item)
    @items.delete(item)
  end
end
