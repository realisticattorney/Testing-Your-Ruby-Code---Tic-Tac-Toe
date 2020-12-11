require_relative "../lib/game.rb"

describe Game do
  let(:player1) {'Neko'}
  let(:player2) {'German'}
  let(:board) {[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']}
  let(:game) {Game.new(player1,player2)}
  context "intialize" do
    it "Start a game with player1 with the symbol X" do
      expect(game.player1.symbol).to eql('X')
    end
    it "Start a game with player2 with the symbol O" do
      expect(game.player2.symbol).to eql('O')
    end
    it "Checks if the name of player1 equals player1 variable" do
      expect(game.player1.name).to eql(player1)
    end
    it "Checks if the name of player2 equals player2 variable" do
      expect(game.player2.name).to eql(player2)
    end
  end
  context "#valid?" do
    it "Check if number is not bigger than 9" do
      expect(game.valid?(10)).to eql false
    end
    it "Check if number is not less than 1" do
      expect(game.valid?(0)).to eql false
    end
  end
  context "#occupied?" do
    it "check if position is  occupied" do
      game.move(1,board,true)
      game.move(2,board,false)
      game.move(3,board,true) 
      expect(game.free?(4,board)).to eql true
      expect(game.free?(3,board)).to eql false
    end
  end
  context "#win?" do
    it "checks if first row is occupied" do
      game.move(1,board,true)
      game.move(2,board,true)
      game.move(3,board,true)
      expect(game.did_win?(board)).to eql true 
    end
    it "checks if second column is occupied" do
      game.move(8,board,false)
      game.move(5,board,true)
      game.move(2,board,true)
      expect(game.did_win?(board).nil?).to eql true 
    end

    it "checks if first diagonal is occupied" do
      game.move(9,board,true)
      game.move(5,board,true)
      game.move(1,board,true)
      expect(game.did_win?(board)).to eql true 
    end
    it "checks if reversed diagonal is occupied" do
      game.move(7,board,false)
      game.move(5,board,true)
      game.move(3,board,true)
      expect(game.did_win?(board).nil?).to eql true 
    end
  end
  context "#draw?" do
    it "checks if first row is occupied" do
      game.move(1,board,false)
      game.move(2,board,true)
      game.move(3,board,false)
      game.move(4,board,false)
      game.move(5,board,false)
      game.move(6,board,true)
      game.move(7,board,true)
      game.move(8,board,false)
      game.move(9,board,true)
      expect(game.did_draw?(board)).to eql true 
    end
  end
end