class TicTacToe
    WIN_COMBINATIONS = [[0,1,2],  [3,4,5],  [6,7,8],  [0,3,6],  [1,4,7],  [2,5,8],  [0,4,8],  [2,4,6]]
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
        turn_count.even? ? "X" : "O"
    end
    def turn
        player = current_player
        puts "Player #{player}, please enter a number 1-9:"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            move(index, player)
            display_board
        else
            gets.chomp
        end
    end
    def won?
        x_win = WIN_COMBINATIONS.detect{ 
            |combo|
        @board[combo[0]] == "X" &&
        @board[combo[1]] == "X" &&
        @board[combo[2]] == "X" }

        o_win = WIN_COMBINATIONS.detect{ 
            |combo|
        @board[combo[0]] == "O" &&
        @board[combo[1]] == "O" &&
        @board[combo[2]] == "O" }
        return x_win || o_win
    end
    def full?
        @board.all?{|x| x != " "}
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
# Our Table:
# 0 1 2
# 3 4 5
# 6 7 8
# Their Table:
# 1 2 3
# 4 5 6
# 7 8 9