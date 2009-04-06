require File.dirname(__FILE__) + '/spec_helper.rb'
require 'rubygems'

describe Object do

  it "should work well integers" do
    1.match_method([1],2).should == ['+','<<'].sort
    2.match_method([2],4).should == ['**','*',"+","power!","rpower"].sort
    5.match_method([4],1).should == ['%','-','/','<=>','div','modulo','remainder','^','gcd'].sort
    47.match_method([1],200).should == []
  end

  it "should work well with arrays" do
    [1].match_method([1],true).should == ['member?','include?'].sort
    [1,2,3,4,5,6].match_method([4],5).should == ['[]','at','delete_at','fetch','slice','slice!'].sort  
  end

  it "should work with blocks" do
    [1,2,3,4,5].match_method([],[1,3,5]) do |i|
      (i % 2 == 1)
    end.should == ["find_all", "select", "should_not"].sort
  end

  it "should respond to alter_match_methods" do
    1.should respond_to(:alter_match_methods)
    [].should respond_to(:alter_match_methods)
    {}.should respond_to(:alter_match_methods)
  end

  it "should be able to remove methods from match list" do
    1.alter_match_methods :delete, ["to_s"]
    1.matchable_methods.should_not include "to_s"
    2.alter_match_methods :delete, ["to_s", "to_f"]
    2.matchable_methods.should_not include "to_s"
    2.matchable_methods.should_not include "to_f"
  end  

  it "should be able to add methods to match list" do
    1.alter_match_methods :add, ["next_prime"]
    1.matchable_methods.should include "next_prime"    
    2.alter_match_methods :add, ["next_prime", "next_fib"]
    2.matchable_methods.should include "next_prime"
    2.matchable_methods.should include "next_fib"
  end  
    
end