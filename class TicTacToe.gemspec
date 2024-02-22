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

  def valid_mpve?(position)
    position.between?(1,9) && @board[position - 1].is_a?(Integer)
  end 

  def switch_player
    @current_player = (current_player == 'X') ? 'O' :'X'
  end 

  def check_winner 
    (0..2).each do |i|
      return @board[i] if @board[i] == @board[i+3] && @board[i] == @board[i+6]
      return @board[i*3] if @board[i*3] == @board[i*3+1] && @board[i*3] == @board[i*3+2]
    end 

    return @board[0] if @board[0]== @board[4] && @board[0] == @board[8]
    return @board[2] if @board[2]== @board[4] && @board[2] == @board[6]

    nil
  end 