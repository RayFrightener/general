class TicTacToe
  def initialize
    @board = (1..9).to_a
    @current_player = 'X'
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def make_move(position)
    if valid_move?(position)
      @board[position - 1] = @current_player
      switch_player
    else
      puts 'Invalid move. Try again.'
    end
  end

  def valid_move?(position)
    position.between?(1,9) && @board[position - 1].is_a?(Integer)
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def check_winner
    (0..2).each do |i|
      return @board[i] if @board[i] == @board[i + 3] && @board[i] == @board[i + 6]
      return @board[i * 3] if @board[i * 3] == @board[i * 3 + 1] && @board[i * 3] == @board[i * 3 + 2]
    end

    return @board[0] if @board[0] == @board[4] && @board[0] == @board[8]
    return @board[2] if @board[2] == @board[4] && @board[2] == @board[6]

    nil
  end

  def board_full?
    @board.all? { |cell| cell.is_a?(String) }
  end
end

#game loop
game = TicTacToe.new

loop do
  system("clear") || system("cls")
  game.display_board

  puts "Player #{@current_player}, enter your move (1-9):"
  position = gets.chomp.to_i

  if position.between?(1,9)
    game.make_move(position)

    winner = game.check_winner
    if winner
      system("clear") || system("cls")
      game.display_board
      puts "Player #{winner} wins!"
      break
    elsif game.board_full?
    system("clear") || system("cls")
    game.display_board
    puts "It's a draw!"
    break
    end 
    next_player = (@current_player == 'X') ? 'O' : 'X'
    puts "Player #{next_player}, make a move."
  else 
    puts "Invalid input. Enter a number between  1 and 9."
  end 
end 