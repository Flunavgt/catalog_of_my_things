require_relative '../item'
require 'date'


class Book < Item
  attr_reader :publish_date,:publisher, :cover_state

  def initialize(publish_date, publisher, cover_state,id: nil)
    super(id, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
