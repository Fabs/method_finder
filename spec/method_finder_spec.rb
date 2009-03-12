require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.info/
describe Kernel do
    
  
  it "should work well integers" do
    match_method(1,[1],2).should == ['+','<<'].sort
    match_method(2,[2],4).should == ['**','*',"+"].sort
    match_method(5,[4],1).should == ['%','-','/','<=>','div','modulo','remainder','^'].sort
    match_method(47,[1],200).should == []
  end
  
  it "should work well with arrays" do
    match_method([1],[1],true).should == ['member?','include?'].sort
    match_method([1,2,3,4,5,6],[4],5).should == ['[]','at','delete_at','fetch','slice','slice!'].sort  
  end
  
  
  
end