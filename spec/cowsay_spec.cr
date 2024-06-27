require "./spec_helper"

describe Cowsay do
  it "has a version number" do
    Cowsay::VERSION.should be_a(String)
  end
end
