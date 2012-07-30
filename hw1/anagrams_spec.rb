require_relative 'anagrams'

describe "combine_anagrams" do
    it "should handle empty arrays" do
        combine_anagrams([]).should eq([])
    end

    it "should handle the following example" do
        combine_anagrams(%w(cars for potatoes racs four scar creams scream)).should =~ [
            ["cars", "racs", "scar"],
            ["four"],
            ["for"],
            ["potatoes"],
            ["creams", "scream"]
        ]
    end

    it "should preserve cases" do
        combine_anagrams(%w(Cars for potAtoes raCS four SCAR creams Scream)).should =~ [
            ["Cars", "raCS", "SCAR"],
            ["four"],
            ["for"],
            ["potAtoes"],
            ["creams", "Scream"]
        ]
    end
end
