require 'rspec'
require 'dessert'



# For tonight's homework, we will be implementing some specs for the Dessert class!
#
# Here's what you need to do:
#
# Download the project skeleton
# Review the dessert.rb and chef.rb files to see what functionality exists. Do not edit or add any code to these files.
# In the dessert_spec.rb file, implement all of the pending specs (the it statements without blocks).
# Run your specs and see that they all pass!
# Hints: You should be using mocks for the Chef class - don't make actual instances of the Chef class! We want to isolate and test the behavior of the Dessert class on its own. If you get stuck, revisit the reading on creating mocks/doubles. The chef double has already been created for you, but you will need to add to it!
#
# Note: Technically, this is not Test Driven Development since we've provided the Dessert class for you. That's okay! The idea for tonight's homework is to familiarize you with RSpec syntax and methods. Enjoy your dessert!
#
# After you finish the homework, or if you get stuck on one of the problems, you can view the solutions here.

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:parfait) { Dessert.new('parfait', 3, 'Boyardee') }
  let(:chef) { double("chef", name: "Boyardee") }

  describe "#initialize" do
    it "sets a type" do
      expect(parfait.type).to eq('parfait')
    end

    it "sets a quantity" do
      expect(parfait.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(parfait.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('parfait', '3', 'Boyardee') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      parfait.add_ingredient('yoghourt')
      expect(parfait.ingredients).to include('yoghourt')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(parfait.ingredients).to receive(:shuffle!)
      parfait.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      parfait.eat(1)
      expect(parfait.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { parfait.eat(4) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Boyardee the Great Baker")
      expect(parfait.serve).to eq("Chef Boyardee the Great Baker has made 3 Parfaits!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(parfait)
      parfait.make_more
    end
  end
end
