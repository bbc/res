require 'res/ir'

describe "I am describe" do
EXAMPLE_FILE_JUNIT = 'spec/outputs/junit.res'
let(:ir) { Res::IR.load( EXAMPLE_FILE_JUNIT ) }
    describe "#tests" do

      it 'returns an array of just the test portions of the json' do
        expect(1).to equal(1)
      end

      it 'only includes Testcase as tests' do
        expect(3).to equal(4)
      end
    end

    describe "#count" do
      it "Can pick out the passing tests from the run" do
        expect(6).to equal(6)
      end

      it "Can pick out the failing tests from the run" do
        expect(1).to eq 1
      end

      it "Can identify there were no tests of an unknown type" do
        expect(0).to eq 0
      end
    end

  context "I am First Context" do
    context "I am context 2" do
      context "I am context 3" do
         context "I am context 4" do
          it "I am first test" do
            expect(1).to equal 2
          end
        end
      end
    end
  end

  context "I am context 3" do    
    it "I am test 2" do 
      expect(4).to equal 4
    end
  end
  
  context "Context 4" do
    it "This is it" do
      expect(3).to equal 3
    end
  end

  it "I am second test" do
      expect(2).to equal 2
  end

  it "I am third test" do
      expect(2).to equal 21
  end

end

describe "I am describe 2" do
  it "I am test 2" do 
    expect(4).to equal 4
  end
end 
