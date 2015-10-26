require 'res/ir'

describe "I am describe" do
EXAMPLE_FILE_JUNIT = 'spec/outputs/junit.res'
let(:ir) { Res::IR.load( EXAMPLE_FILE_JUNIT ) }
    describe "Describe#1" do

      it 'I am passing test#1' do
        expect(1).to equal(1)
      end

      it 'I am failing test#1' do
        expect(3).to equal(4)
      end
    end

    describe "#count" do
      it "I am passing test#2" do
        expect(6).to equal(6)
      end

      it "I am passing test#3" do
        expect(1).to eq 1
      end

      it "I am passing test#4" do
        expect(0).to eq 0
      end
    end

  context "I am First Context" do
    context "I am context 2" do
      context "I am context 3" do
         context "I am context 4" do
          it "I am failing test#2" do
            expect(1).to equal 2
          end
        end
      end
    end
  end

  context "I am context 3" do    
    it "I am passing test#5" do 
      expect(4).to equal 4
    end
  end
  
  context "Context 4" do
    it "I am passing test#6" do
      expect(3).to equal 3
    end
  end

  it "I am passing test#7" do
      expect(2).to equal 2
  end

  it "I am failing test#3" do
      expect(2).to equal 21
  end

end

describe "I am describe 2" do
  it "I am passing test#8" do 
    expect(4).to equal 4
  end
end 
