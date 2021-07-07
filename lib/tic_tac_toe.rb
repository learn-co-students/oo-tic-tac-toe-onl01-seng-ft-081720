require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def input_to_index(user_input)
      user_input.to_i-1
    end
    
    def move(index, piece)
      @board[index] = piece
    end
  
    def position_taken?(index)
      @board[index] != " "
    end
  
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
  
    def turn_count
      @board.count { | space | space != " " }
    end
  
    def current_player
      turn_count.even? ? "X" : "O"
    end
  
    def turn
      puts "Choose your move wisely (1-9):"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
          piece = current_player
          move(index, piece)
      else
        "Please select a valid choice."
        turn
      end
      display_board
    end

    def won?
       a = WIN_COMBINATIONS.detect{
           |combo|
           @board[combo[0]] == "X" &&
           @board[combo[1]] == "X" &&
           @board[combo[2]] == "X" 
       }
       b = WIN_COMBINATIONS.detect{
            |combo|
            @board[combo[0]] == "O" &&
            @board[combo[1]] == "O" &&
            @board[combo[2]] == "O" 
       }
        a||b
    end

    def full?
        @board.all?{|x| x != " "}
    #returns
    end

    def draw?
        !won? && full?
    end

    def over?
        full? || won? || draw?
    end

    def winner 
       if won?
         @board[won?[0]] == "X" ? "X" : "O"
       else
        nil
       end
    end

    def play 
        while over? == false
        turn        
        end       
        if won?           
            puts "Congratulations #{winner}!"
        else            
            puts "Cat's Game!"        
        end    
    end
end
#our board
# 0  1  2
# 3  4  5
# 6  7  8

#users board
#1  2  3
#4  5  6
#7  8  9