# Palindrome spec
require_relative 'palindrome'

describe "palindrome?" do
    it "should handle empty strings" do
        palindrome?("").should eq(true)
    end

    it "should accept A man, a plan, a canal -- Panama" do
        palindrome?("A man, a plan, a canal -- Panama").should eq(true)
    end

    it "should accept Madam, I'm Adam!" do
        palindrome?("Madam, I'm Adam!").should eq(true)
    end

    it "should not accept Abracadabra" do
        palindrome?("Abracadabra").should eq(false)
    end
end

describe "count_words" do
    it "should handle empty strings" do
        count_words("").should eq({})
    end

    it "should handle A man, a plan, a canal -- Panama" do
        count_words("A man, a plan, a canal -- Panama").should eq({
            'a' => 3,
            'man' => 1,
            'plan' => 1,
            'canal' => 1,
            'panama' => 1
        })
    end
end
