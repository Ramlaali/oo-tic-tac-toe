class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    



    WIN_COMBINATIONS = [
       [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [ 2, 4, 6] 

    ]

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
    
    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{ | turn | turn != " "}
    end

    def current_player
        count = turn_count
        count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please select a square (1-9):"
        input = gets.strip
        index = input_to_index(input)

        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            puts "Please select a valid answer (1-9)"
            turn
        end
        display_board
    
    end

    def won?
        WIN_COMBINATIONS.any? do | winning |
            if position_taken?(winning[0]) && @board[winning[0]] == @board[winning[1]] &&
            @board[winning[1]] == @board[winning[2]]
            return winning
            end
        end
    end

    def full?
        @board.all?  do |i|
            position_taken?(@board.index(i))
        end
    end

    def draw?
        results = won?
        if full? && results == false
           return true
        else
            return false
        end
    end

    def over?
        won? || draw? ? true : false
    end

    def winner
        winning_combo = won?
        if winning_combo
            winning_index = winning_combo[0]
            @board[winning_index]
        end
    end

    def play
       until over?
        turn
       end
       if won?
        puts "Congratulations #{winner}!"
       elsif draw?
        puts "Cat's Game!"
       end
    end
    



end