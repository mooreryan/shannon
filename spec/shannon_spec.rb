require "spec_helper"

RSpec.describe Shannon do
  it "has a version number" do
    expect(Shannon::VERSION).not_to be nil
  end

  describe "::entropy" do
    context "given an empty string" do
      it "returns zero" do
        expect(Shannon.entropy "").to be_zero
      end
    end

    context "given a non-empty string" do
      it "returns 0 when all chars are the same" do
        expect(Shannon.entropy "aaaa").to be_zero
      end

      it "returns Shannon entropy for the str" do
        expect(Shannon.entropy "abcde").to be_within(0.0001).of 2.32193
      end

      it "uses base 2 by default" do
        expect(Shannon::entropy "abcde").
          to be_within(0.0001).of Shannon::entropy("abcde", 2)
      end
    end
  end
end
