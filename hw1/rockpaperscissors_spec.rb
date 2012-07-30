require_relative 'rockpaperscissors'

describe "rps_game_winner" do
    it "should raise WrongNumberOfPlayersError if the number of players is not two" do
        lambda { rps_game_winner([]) }.should raise_error(WrongNumberOfPlayersError)
        lambda { rps_game_winner([:foo]) }.should raise_error(WrongNumberOfPlayersError)
        lambda { rps_game_winner([:foo, :bar, :baz]) }.should raise_error(WrongNumberOfPlayersError)
        lambda { rps_game_winner([:foo, :bar]) }.should_not raise_error(WrongNumberOfPlayersError)
    end

    it "should raise NoSuchStrategyError for bogus strategies" do
        lambda { rps_game_winner([["A", "R"], ["B", "P"]]) }.should_not raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "R"], ["B", "S"]]) }.should_not raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "r"], ["B", "p"]]) }.should_not raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "r"], ["B", "s"]]) }.should_not raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "R"], ["B", "F"]]) }.should raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "R"], ["B", "foo"]]) }.should raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "b"], ["B", "P"]]) }.should raise_error(NoSuchStrategyError)
        lambda { rps_game_winner([["A", "bar"], ["B", "baz"]]) }.should raise_error(NoSuchStrategyError)
    end

    it "should determine the correct winner" do
        rps_game_winner([["A", "R"], ["B", "P"]]).should eq(["B", "P"])
        rps_game_winner([["B", "P"], ["A", "R"]]).should eq(["B", "P"])
        rps_game_winner([["A", "R"], ["B", "S"]]).should eq(["A", "R"])
        rps_game_winner([["A", "P"], ["B", "S"]]).should eq(["B", "S"])
        rps_game_winner([["Dave", "S"], ["Richard", "R"]]).should eq(["Richard", "R"])
    end

    it "should let the first player win ties" do
        rps_game_winner([["A", "R"], ["B", "r"]]).should eq(["A", "R"])
        rps_game_winner([["A", "S"], ["B", "S"]]).should eq(["A", "S"])
        rps_game_winner([["A", "p"], ["B", "P"]]).should eq(["A", "P"])
    end
end

describe "rps_tournament_winner" do
    it "should handle single games" do
        rps_tournament_winner([["A", "R"], ["B", "P"]]).should eq(["B", "P"])
        rps_tournament_winner([["B", "P"], ["A", "R"]]).should eq(["B", "P"])
        rps_tournament_winner([["A", "S"], ["B", "S"]]).should eq(["A", "S"])
    end

    it "should handle an example tournament" do
        rps_tournament_winner([
        [
            [ ["Armando", "P"], ["Dave", "S"] ],
            [ ["Richard", "R"], ["Michael", "S"] ],
        ],
        [
            [ ["Allen", "S"], ["Omer", "P"] ],
            [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
        ]).should eq(["Richard", "R"])
    end
end
