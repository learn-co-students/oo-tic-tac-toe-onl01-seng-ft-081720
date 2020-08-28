require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]]

    def initialize 
        @board = [" "," "," "," "," "," "," "," "," "]
       
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        string.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        user_input = gets
        index = input_to_index(user_input)
        if valid_move?(index)
            piece = current_player
            move(index, piece)
            display_board
        else
            user_input = gets
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
                @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[1])
         end  
    end

    def full?
        @board.none? do |input|
            input == " "
        end
    end

    def draw?
        if won? || !full?
            false
        else 
            true
        end
    end

    def over?
        if won? || full?
            true
        end
    end

    def winner
        @board[won?[0]]
    end




end