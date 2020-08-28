require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, piece)
        @board[index] = piece
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count { |spaces| spaces != " " }
    end

    def current_player
        num_turns = turn_count
        if num_turns % 2 == 0
          player = "X"
        else
          player = "O"
        end
        return player
      end

    def turn 
            puts "Choose your move 1-9:"
            input = gets.chomp
            index = input_to_index(input)
            if valid_move?(index)
              player_token = current_player
              move(index, player_token)
              display_board
            else
              gets.chomp
          end  
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
       return a || b
    end 

    def full?
        @board.all?{|x| x !=" "}
    end

    def draw?
        !won? && full?
    end

    def over?
        if won? || draw?
          return true
        else
          return false
        end
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
