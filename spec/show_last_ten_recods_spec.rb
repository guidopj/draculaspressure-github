[
  %w( abc  123  def  ),
  %w( wxyz 9876 ab   ),
  %w( mn   10   pqrs )
].each do |a,b,c|
  describe "Given inputs #{a} and #{b}" do
    it "returns #{c}" do
      Something.whatever(a,b).should == c
    end
  end
end
