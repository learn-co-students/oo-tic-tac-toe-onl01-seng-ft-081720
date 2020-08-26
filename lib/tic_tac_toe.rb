require "pry"

class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left Column
        [1,4,7], # Middle Column
        [2,5,8], # Right Column
        [0,4,8], # Diagonal Down
        [6,4,2]  # Diagonal Up
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, player="X")
        @board[index] = player
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn
        puts "Select a space from 1-9:"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index) 
            move(index, current_player)
        else
           turn
        end 
        display_board
    end

    def turn_count
        @board.count {|x| x != " "}
    end

    def current_player
        self.turn_count.even? ? ("X") : ("O")
    end

    def won?
        win_combo = nil
        win_combo if WIN_COMBINATIONS.any? do |win_moves|
            win_combo = win_moves
            win_moves.all? {|position| @board[position] == "X"} || 
            win_moves.all? {|position| @board[position] == "O"}
            # if position_taken?(win_moves[0]) && @board[win_moves[0]] == @board[win_moves[1]] && @board[win_moves[1]] == @board[win_moves[2]]
            #     return win_moves
        #end
        end   
    end

    def full?
        @board.all? {|p| p != " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner
        @board[won?[0]] if won?
    end
    
    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end