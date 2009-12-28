require File.dirname(__FILE__) + '/spec_helper.rb'

describe Object do
  it "should work well integers" do
    1.match_method([1],2).should == ['+','<<'].sort
    2.match_method([2],4).should == ['**','*',"+"].sort #Don't understand why 'power!' and 'rpower' are not on fixnum methods unless we require 'rubygems'
    5.match_method([4],1).should == ['%','-','/','<=>','div','modulo','remainder','^'].sort #same happens for 'gcd'
    47.match_method([1],200).should == []
  end
  
  it "should work well with arrays" do
    [1].match_method([1],true).should == ['member?','include?'].sort
    [1,2,3,4,5,6].match_method([4],5).should == ['[]','at','delete_at','fetch','slice','slice!'].sort  
  end
    
  it "should work with blocks" do
    [1,2,3,4,5].match_method([],[1,3,5]) do |i|
      (i % 2 == 1)
    end.should == ["find_all", "select"].sort
  end
  
  it "should work with strings as parameters" do
    1.match_method(["respond_to?"], true).should == ["respond_to?"]
  end
    
  context String do    
    it "should work with two arguments on String" do
      "rails".match_method(["r", "f"], "fails").should == ["gsub", "gsub!", "sub", "sub!", "tr", "tr!", "tr_s", "tr_s!"]
    end
  end
end
