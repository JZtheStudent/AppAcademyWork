class Hangman
  
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample 
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching = []
    (0...@secret_word.length).each { |i| matching << i if @secret_word[i] == char}
    matching
  end

  def fill_indices(char, idxs)
    idxs.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false 
    end
    @attempted_chars << char 
    matching = get_matching_indices(char)
    if matching.length == 0
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, matching)
    end
    true

  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else 
      return false 
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end


end
