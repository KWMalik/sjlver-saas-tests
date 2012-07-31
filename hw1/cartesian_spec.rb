require_relative 'cartesian'

describe CartesianProduct do
    it "should compute the carthesian product of two arrays" do
        c = CartesianProduct.new([:a, :b], [4, 5])
        c.to_a.should =~ [[:a, 4], [:a, 5], [:b, 4], [:b, 5]]
    end

    it "should be empty if one array is empty" do
        c = CartesianProduct.new([:a,:b], [])
        c.to_a.should =~ []
    end

#    it "should work with more than two arguments" do
#        c = CartesianProduct.new([:a,:b], [4,5], [:c])
#        c.to_a.should =~ [[:a, 4, :c], [:a, 5, :c], [:b, 4, :c], [:b, 5, :c]]
#    end
end
