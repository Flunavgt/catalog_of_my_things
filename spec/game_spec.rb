require 'date'
require_relative '../game/game'
require_relative '../item'

describe 'Game' do
  it 'should be able to be created' do
    game = Game.new(true, '10/10/2010', 'Super Mario')
    expect(game).to be_a(Game)
  end

  it 'should be able to be created with an id' do
    game = Game.new(true, '10/10/2010', 'Super Mario', id: 1)
    expect(game.id).to eq(1)
  end

  it 'should be able to be created with a last played date' do
    game = Game.new(true, '10/10/2010', 'Super Mario')
    expect(game.last_played).to eq('10/10/2010')
  end
end
