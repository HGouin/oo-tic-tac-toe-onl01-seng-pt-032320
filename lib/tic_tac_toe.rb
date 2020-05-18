class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(space_number)
    space_number.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    if index < 0 || index > 8
      return false
    end
    !position_taken?(index)
  end

  def turn
    player = current_player
    puts "#{player}, please set your position between 1-9: "
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    (0..@board.length - 1).count{|index| position_taken?(index)}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |wc|
      next if !position_taken?(wc[0]) || !position_taken?(wc[1]) || !position_taken?(wc[2])
      return wc if @board[wc[0]] == @board[wc[1]] && @board[wc[1]] == @board[wc[2]]
    end
    false
  end

  def full?
    turn_count == @board.length
  end

  def draw?
    full? && !won?
  end

  def over?
<<<<<<< HEAD
    won? || draw?
=======
    full? || won?
>>>>>>> 944331e0140f4da79376174ceff6750fdbcb3a5a
  end

  def winner
    return nil if !won?
    turn_count % 2 == 1 ? "X" : "O"
  end

  def play
    while !over?
      turn
    end

    if won?
<<<<<<< HEAD
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
=======
      puts "Congrats, #{winner}! You won!"
    elsif draw?
      puts "It was a draw"
>>>>>>> 944331e0140f4da79376174ceff6750fdbcb3a5a
    end
  end

end
