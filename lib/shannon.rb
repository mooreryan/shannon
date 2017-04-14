require "shannon/version"

module Shannon
  def self.char_counts str
    counts = Hash.new 0

    str.each_char do |char|
      counts[char] += 1
    end

    counts
  end

  def self.char_probs str
    counts = self.char_counts str

    counts.values.map { |count| count / str.length.to_f }
  end

  def self.probs_to_entropy probs
    - probs.reduce(0.0) { |sum, prob| sum += prob * Math.log2(prob) }
  end

  def self.entropy str
    if str.empty?
      nil
    else
      self.probs_to_entropy self.char_probs(str)
    end
  end
end
