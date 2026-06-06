require "simplecov"

require_relative "../lib/greeter"

RSpec.describe Greeter do
  it "greets by name" do
    greeter = Greeter.new
    expect(greeter.greet("World")).to eq("Hello, World!")
  end
end
