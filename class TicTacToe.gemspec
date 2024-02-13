class TicTacToe
  def initialize 
    @board = (1..9).to_a
    @current_player = 'X'
  end 

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end 

  def make_move(position)
    if valid_move?(position)
      @board[position - 1] = @current_player
      switch_player
    else 
      puts "Invalid move. Try again."
    end 
  end 
