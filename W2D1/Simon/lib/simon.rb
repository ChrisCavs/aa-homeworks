class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless self.game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the colors one at a time"

    self.seq.each do |color|
      input = gets.chomp

      if color != user_color
        self.game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "well done!  on to the next round..."
    sleep(3)
  end

  def game_over_message
    puts "Sorry, game over..."
    sleep(3)
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
