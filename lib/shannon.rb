require "shannon/version"

module Shannon

  # Calculate Shannon entropy for a string.
  #
  # @example
  #   Shannon::entropy("abcde", 2).round(4) #=> 2.3219
  #
  # @param str [String] string to calculate entropy of
  # @param base [Fixnum] base of the log for calculation
  def self.entropy str, base=2
    len = str.length.to_f

    str.each_char.
      group_by(&:itself).
      values.
      map { |ary| ary.length / len }.
      reduce(0) { |entropy, freq| entropy - freq * Math.log(freq, base) }
  end
end
