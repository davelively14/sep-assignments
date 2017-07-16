require_relative 'separate_chaining/separate_chaining.rb'
require_relative 'open_addressing/open_addressing.rb'

module PrintHash
  def print_separate_chaining
    hash = SeparateChaining.new(5)
    setup_hash(hash)
    puts hash.print
  end

  def print_open_addressing
    hash = OpenAddressing.new(3)
    setup_hash(hash)
    puts hash.print
  end

  private

  def setup_hash(hash)
    hash["Star Wars: The Phantom Menace"] = "Number One"
    hash["Star Wars: Attack of the Clones"] = "Number Two"
    hash["Star Wars: Revenge of the Sith"] = "Number Three"
    hash["Star Wars: A New Hope"] = "Number Four"
    hash["Star Wars: The Empire Strikes Back"] = "Number Five"
    hash["Star Wars: Return of the Jedi"] = "Number Six"
  end
end

include PrintHash

PrintHash.print_separate_chaining
puts ""
PrintHash.print_open_addressing
