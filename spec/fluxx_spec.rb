class Keeper
  def play(player,game)
    player.keeper = self
  end
end

class Goal
  def initialize(&winning_condition)
    @winning_condition = winning_condition
  end

  def play(player,game)
    game.goal = self
  end

  def winner(players)
    players.select( &@winning_condition ).first
  end
end

class Player
  attr_accessor :keepers
  attr_reader :card

  def initialize
    keepers = []
  end

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
    @goal.winner(@players)
  end
end

module Keepers
  LOVE = Keeper.new
  WAR = Keeper.new
  PEACE = Keeper.new
end

module Goals
  ALL_YOU_NEED_IS_LOVE = Goal.new {|x| x.keepers == [Keepers::LOVE]}
end

describe "a fluxx player wins with" do
  it "All You Need Is Love" do
    p1 = Player.new
    game = Game.new

    game.register(p1)

    p1.keepers = [ Keepers::LOVE ]
    game.goal = Goals::ALL_YOU_NEED_IS_LOVE

    game.winner.should be p1
  end
end

describe "a fluxx player doesn't win with" do
  it "All You Need Is Love and Something Else" do
    p1 = Player.new
    game = Game.new

    game.register(p1)

    p1.keepers = [ Keepers::LOVE, Keepers::WAR ]
    game.goal = Goals::ALL_YOU_NEED_IS_LOVE

    game.winner.should be nil
  end
end
