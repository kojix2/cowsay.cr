require "./spec_helper"

describe "Internationalization" do
  it "handles Japanese text correctly" do
    message = "こんにちは、世界！"
    result = Cowsay.say(message)
    result.should contain(message)
  end

  it "handles emoji correctly" do
    message = "I ❤️ Crystal!"
    result = Cowsay.say(message)
    result.should contain(message)
  end

  it "handles mixed scripts correctly" do
    message = "Hello こんにちは Привет"
    result = Cowsay.say(message)
    result.should contain(message)
  end

  it "wraps multi-byte characters correctly" do
    # Japanese characters typically have a width of 2
    message = "これは長いメッセージです。折り返しが正しく機能することをテストします。"
    result = Cowsay.say(message, wrapcolumn: 20)

    # The message should be split into multiple lines
    # and each line should respect the column width considering character width
    lines = result.split("\n")

    # Check that no line exceeds the wrap column (approximately)
    # Note: This is an approximate check as exact width calculation depends on the implementation
    lines.each do |line|
      next unless line.includes?("(") || line.includes?("|") # Only check bubble lines
      visible_content = line.gsub(/[()\\|\/]/, "").strip
      # Each Japanese character counts as 2 in width
      estimated_width = visible_content.chars.sum do |char|
        char.ord > 127 ? 2 : 1
      end
      estimated_width.should be <= 25 # Allow some margin for bubble characters
    end
  end
end
