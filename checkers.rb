class Game
  
  def initialize
    @p1, @p2 = player_prompt
    @current_player = @p1
    @board = Board.new
  end
  
  def run
    welcome
    setup_board
    until game_finished?
      @board.display
      @current_player.move
      
    end
    
    display_results
  end
  
  def player_prompt
    [1,2].each do |player_num|
      puts "Is player #{player_num} (h)uman or (c)omputer?"
      puts "Player 1 will play black, player 2 will play white."
      if gets.chomp.downcase == "h"
        puts "What is player #{player_num}'s name?"
        p1 = HumanPlayer.new(gets.chomp) unless player_num == 2
        p2 = HumanPlayer.new(gets.chomp) unless player_num == 1
      elsif gets.chomp.downcase == "c"
        p1 = ComputerPlayer.new unless player_num == 2
        p2 = ComputerPlayer.new unless player_num == 1
      else
        raise "Please enter either 'h' for human or 'c' for computer"
      end
    end
    return p1,p2
  end
  
  def welcome
  end

  def game_finished?
    return true if @current_player.piece_count == 0
    false
  end
  
  def display_results
    "Game over. #{@current_player} wins!"
  end
    
end

class Board
  
  def initialize
    @squares = Array.new(8) { Array.new(8) }
  end
  
  def display
    @squares.each do |row|
      p row
      puts
    end
  end
  
  def [](col, row)
    @squares[row][col]
  end
  
  def []=(col, row, value)
    @squares[@squares.length - row][col - 1] = value
  end
end

class Piece
  
  def initialize
  end
  # Probably don't need a PawnPiece and KingPiece; 
  # just "promote" a Piece to king when it hits the opposite row.
  
  def slide_moves
    # list
  end
    
  def jump_moves
    #list
  end
  
  def perform_slide
    #validate slide
    
    # an illegal slide/jump should raise an InvalidMoveError
  end
  
  def perform_jump
    #validate jump
    #removed jumped piece from board
    
    # an illegal slide/jump should raise an InvalidMoveError
  end
  
  def perform_moves!(move_sequence)
    # one slide, or one or more jumps
    # should perform the moves one_by_one
    # if a move in the sequence fails, an InvalidMoveError should be raised
    
    # shouldn't bother with restoring the original Board state if it fails
  end
  
  def valid_move_seq?
    # calls perform_moves! on a duped Piece / Board
    # if no error is raised return true, else false
    #    requires a begin / rescue / else
    # should not modify the original board because we dup the objects
  end
  
  def perform_moves
    # checks valid_move_seq? 
    # and either calls perform_moves! or raises an InvalidMoveError
  end
  
end

class KingPiece < Piece
  
  def initialize
  end
  
  
end


class Player
  
  def initialize
    @piece_count = 12
  end
  
  def move
  end
  
end

class HumanPlayer < Player
  def initialize(name)
    @name = name
  end
  
  def move
    puts "Where do you want to move from? (col, row)"
    start_pos = gets.chomp.split(",").map(&:to_i)
    
    
    
    puts "Where do you want to move to? (col, row)"
    end_pos = gets.chomp.split(",").map(&:to_i)
  end
end

class ComputerPlayer < Player
  def initialize
  end
end