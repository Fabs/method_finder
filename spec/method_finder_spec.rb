require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.info/
describe Kernel do
    
  
  it "should work well integers" do
    match_method(1,[1],2).should == ['+','<<'].sort
    match_method(2,[2],4).should == ['**','*',"+","power!","rpower"].sort
    match_method(5,[4],1).should == ['%','-','/','<=>','div','modulo','remainder','^','gcd'].sort
    match_method(47,[1],200).should == []
  end
  
  it "should work well with arrays" do
    match_method([1],[1],true).should == ['member?','include?'].sort
    match_method([1,2,3,4,5,6],[4],5).should == ['[]','at','delete_at','fetch','slice','slice!'].sort  
  end
  
  it "should work with blocks" do
    match_method([1,2,3,4,5],[],[1,3,5]) do |i|
      (i % 2 == 1)
    end.should == ["find_all", "select", "should_not"].sort
  end
  
end
