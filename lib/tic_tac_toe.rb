require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " ",]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(num)
        num = num.to_i - 1
    end

    def move(position, player = "X")
        @board[position] = player
    end

    def position_taken?(position)
        if @board[position] == "X" || @board[position] == "O"
            taken = true
        else
            taken = false
        end 
    end

    def valid_move?(position)
        if position >= 0 && position <= 8 && position_taken?(position) == false
            valid = true
        else
            valid = false
        end   
    end

    def turn_count
        counter = 0
        @board.each do |spot|
            if spot == "X" || spot == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player
        if turn_count % 2 == 0
            player = "X"
        else 
            player = "O"
        end
    end

    def turn
        puts "Please enter a number (1-9):"
        input = gets.strip
        input = input_to_index(input)
        if valid_move?(input)
            @board[input] = current_player
        else
            turn
        end
        display_board
    end

    def won?
        if x_win = WIN_COMBINATIONS.find {|win_moves|
            @board[win_moves[0]] == "X" &&
            @board[win_moves[1]] == "X" &&
            @board[win_moves[2]] == "X"}
            x_win

        elsif o_win = WIN_COMBINATIONS.find {|win_moves|
            @board[win_moves[0]] == "O" &&
            @board[win_moves[1]] == "O" &&
            @board[win_moves[2]] == "O"}
            o_win
        end
    end

    def full?
        if turn_count == 9
            full_board = true
        end
    end

    def draw?
        if full? && !won?
            draw = true
        end
    end

    def over?
        if draw? || won?
            over = true
        end
    end

    def winner
        if won? && turn_count % 2 == 1
            winner = "X"
        elsif won? && turn_count % 2 == 0
            winner = "O"
        end
    end

    def play
        while !over?
            turn
        end
        if over? && won?
            winner
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end