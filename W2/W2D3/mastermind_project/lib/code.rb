class Code

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.each { |char| return false if !POSSIBLE_PEGS.include?(char.upcase) }
    return true
  end

  attr_reader :pegs

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise "Invalid pegs"
    else
      @pegs = chars.map { |char| char = char.upcase }
    end
  end

  def self.random(length)
    pegs = []
    length.times { pegs << POSSIBLE_PEGS.keys[rand(0...POSSIBLE_PEGS.length)] }
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    (0...length).each { |i| count += 1 if code[i] == self[i]}
    count 
  end

  def num_near_matches(code)
    code_dup = self.pegs.dup
    guess_dup = code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(code)
    self.pegs == code.pegs
  end

end
