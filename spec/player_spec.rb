# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  let(:name) { 'Ali' }
  let(:symbol) { 'X' }
  let(:player) { Player.new(name, symbol) }

  describe 'intializing' do
    context 'Assign values to player name & symbol' do
      it 'Assign name to player' do
        expect(player.name).to eql(name)
      end
      it 'Assign symbol to player' do
        expect(player.symbol).to eql(symbol)
      end
      it 'Check if player name equals the variable name' do
        expect(player.name == name).to eql(true)
      end
      it 'Check if player symbol equals the variable symbol' do
        expect(player.symbol == symbol).to eql(true)
      end
    end
  end
end
