require_relative 'dessert'

describe Dessert do
    before(:each) do
        @apple = Dessert.new("Apple", 70)
        @applepie = Dessert.new("Apple pie", 300)
        @applebean = JellyBean.new("Apple jelly bean", 3, :apple)
        @liquoricebean = JellyBean.new("Liquorice jelly bean", 3, "black licorice")
    end

    it "should know whether it's healthy" do
        @apple.healthy?.should be_true
        @applepie.healthy?.should be_false
        @applebean.healthy?.should be_true
        @liquoricebean.healthy?.should be_true
    end

    it "should know whether it's delicious" do
        @apple.delicious?.should be_true
        @applepie.delicious?.should be_true
        @applebean.delicious?.should be_true
        @liquoricebean.delicious?.should be_false
    end
end
