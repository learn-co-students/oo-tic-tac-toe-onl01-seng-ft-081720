require 'pry'
class TicTacToe
  attr_accessor :board
  #initializes a board with 9 spaces in an array of strings
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
#all of the possible winning combinations
  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def display_board
    #displays top row of board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    #displays middle of board
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    #displays bottom of board
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    #turns the user into an interger - 1 sets it to default 0
    #get a better understanding of why - 1
    user_input.to_i - 1
  end
#Allows the current player to make a move
  def move(index, current_player)
    @board[index] = current_player
    
  end
#checks the board to see what positions on the board are takena nd by whom in which they are taken by
  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end
#checks to make sure the user_input of move is between the acceptable answer of board index 0 and 8
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
#counts the amount of turns the players take
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
#Checks to see which players turn it is
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    #recieves user input via the gets method
    puts "Please enter 1-9:"
    input = gets.strip
    #calls #input_to_index, #valid_move?, and #current_player
    index = input_to_index(input)
    player = current_player
    #makes valid moves and displays the board
    if valid_move?(index)
      move(index, player)
      display_board
    else
      #asks for users input again after a failed validation
      turn
    end
  end

  def won?
    #returns the winning combo for a win
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
      #returns false if the game is a draw
        false
    end
  end

  def full?
    @board.all?{|occupied| occupied != " "}
  end
  
  def draw?
    !(won?) && (full?)
  end
  
  def over?
    won? || full? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  
end