class TicTacToe
    attr_accessor :board

    def initialize
        @board = Array.new(9," ")
    end
    
    WIN_COMBINATIONS =  [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
 
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

    def move(index, play)
        @board[index] = play
    end
 
    def position_taken?(index)
      @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn
      player = current_player
      puts "Please enter a number 1-9:"
      input = gets.chomp
      index = input_to_index(input)
      if valid_move?(index)
        move(index, player)
      else
        puts "Invalid Move. Please try again."
        turn
      end
      display_board
    end

    def turn_count
        @board.count {|token| token == "X" || token == "O"}   
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    
    def won?
      xwin = WIN_COMBINATIONS.find {|comb| @board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X"}
      owin = WIN_COMBINATIONS.find {|comb| @board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O"}
      xwin || owin 
    end

    def full?
      @board.all? {|x| x != " "}
    end

    def draw?
      !won? && full?
    end

    def over?
        if won? || draw?
            true
        else
            nil
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
        until over? == true
          turn
        end

        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end