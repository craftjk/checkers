class Board
  
  
  
end

class Piece
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



class User
  
  
  
end



