class Keeper
  def play(player,game)
    player.keeper = self
  end
end

class Goal
  def play(player,game)
    game.goal = self
  end
end

class Player
  attr_accessor :keeper
  attr_reader :card
  def draw
    @card = @game.drawpile.shift
  end

  def playing(game)
    @game = game
  end
  
  def play
    @card.play(self,@game)
  end
end

class Game
  attr_accessor :drawpile, :goal
  
  def initialize
    @players = []
  end

  def register(player)
    @players << player
    player.playing(self)
  end

  def winner
    @players.select {|x| !x.keeper.nil?}.first
  end
end

describe "fluxx" do
  it "can play a simple game" do
    game = Game.new
    keeper = Keeper.new
    goal = Goal.new
    game.drawpile = [keeper, goal]
    player1 = Player.new
    player2 = Player.new
    game.register(player1)
    game.register(player2)

    player1.draw
    player1.card.should eq(keeper)
    player1.play
    player1.keeper.should eq(keeper)

    player2.draw
    player2.card.should eq(goal)
    player2.play
    game.goal.should eq(goal)
    game.winner.should eq(player1)
  end

  it "can play a different simple game" do
    game = Game.new
    keeper = Keeper.new
    goal = Goal.new
    game.drawpile = [goal, keeper]
    player1 = Player.new
    player2 = Player.new
    game.register(player1)
    game.register(player2)

    player1.draw
    player1.play

    player2.draw
    player2.play
    game.winner.should eq(player2)
  end
end

