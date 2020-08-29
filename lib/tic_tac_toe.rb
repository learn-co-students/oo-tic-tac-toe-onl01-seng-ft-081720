require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
 

 def initialize(board = nil)
    @board = board || Array.new(9, " ")
end 
 
 
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 def input_to_index(input)
   input.to_i - 1  
 
end 

def move(index,value = "X")
  @board[index] = value 
end
 
 
 def position_taken?(index)
if @board[index] == " " ||  @board[index] == "" || @board[index] == nil
   return false 
 elsif  @board[index] == "X" || @board[index] == "O"
 return true
end
end

def valid_move?(index)
   if position_taken?(index) 
     return false 
   elsif index.between?(0,8)
     return true
 end 
 end
 def turn
  puts "Please enter 1-9:"
  number = gets.strip
 number2 = input_to_index(number)
  if  valid_move?(number2)
    move(number2,current_player)
  else 
    turn
  end
 display_board
end
 
def turn_count
  x = 0 
@board.each do |turns|
  if turns == "X" || turns == "O"
  x += 1
   end
  end
return x
end

def current_player
if   turn_count % 2 == 0 
  return "X"
else 
  return "O"
end
end

def won?
  WIN_COMBINATIONS.each do |winner|
    index_1 = winner[0]
    index_2 = winner[1]
    index_3 = winner[2]
     position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]
    if position_1 == position_2 && position_2 == position_3 && position_taken?(index_1)
      return winner
    end
  end
  return false
end

def full?
  if @board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end

def draw?
   if !won? && full?
     return true
   elsif!full? && !won?
     return false
   else won?
     return false
   end
end

def over?
  if draw? || won? || full? 
    return true
  else
    return false
  end
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
  until  over? 
 turn
end
  if won?
    winner == "X" || winner == "O"
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat\'s Game!"
end
end
   
end 