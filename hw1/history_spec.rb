require_relative 'history'

describe Class do
    it "should have attr_accessor_with_history" do
        Class.should respond_to(:attr_accessor_with_history)
    end

    it "should keep the history of attribute values" do
        class Foo
            attr_accessor_with_history :bar
        end

        f = Foo.new
        f.bar = 3
        f.bar = :wowzo
        f.bar = 'boo!'
        f.bar_history.should eq([nil, 3, :wowzo, 'boo!'])
    end

    it "should keep a separate history per instance" do
        class Foo
            attr_accessor_with_history :bar
        end

        f = Foo.new
        f.bar = 1
        f.bar = 2
        g = Foo.new
        g.bar = 4
        f.bar_history.should eq([nil, 1, 2])
        g.bar_history.should eq([nil, 4])
    end
end

describe Numeric do
    it "should have a dollars method" do
        1.dollar.should eq(1)
        2.dollars.should eq(2)
    end

    it "should have an euros method" do
        1.euro.should be_within(0.001).of(1.292)
        2.euros.should be_within(0.001).of(2.584)
    end

    it "should have a yens method" do
        1.yen.should be_within(0.001).of(0.013)
        3.5.yens.should be_within(0.001).of(0.0455)
    end

    it "should allow conversions" do
        5.dollars.in(:euros).should be_within(0.001).of(3.870)
        10.euros.in(:rupees).should be_within(0.001).of(680)
    end
end

describe String do
    it "should know whether it's a palindrome or not" do
        "".palindrome?.should eq(true)
        "A man, a plan, a canal -- Panama".palindrome?.should eq(true)
        "Madam, I'm Adam!".palindrome?.should eq(true)
        "Abracadabra".palindrome?.should eq(false)
    end
end

describe Enumerable do
    it "should know whether it's a pseudo-palindrome or not" do
        [1, 2 ,3, 2, 1].palindrome?.should be_true
        [].palindrome?.should be_true
        [1, 2, 3].palindrome?.should be_false
        %w(hello world).palindrome?.should be_false
        %w(hello world hello).palindrome?.should be_true
    end
end
