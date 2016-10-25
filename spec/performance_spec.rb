require 'res'

CUCUMBER_COMMAND = "unset BUNDLE_GEMFILE; unset RUBYOPT; cd examples/cucumber; bundle exec cucumber"
TMP_FILE = "/tmp/#{rand(999999)}.res"


describe "Reporting value data into IR using Res.perf_data" do
  it "adds key/value pairs into the IR output" do
    ir = Res::IR.load("examples/cucumber/out.res")
    expect(ir.tests.first).to have_key(:values)
    expect(ir.tests.first[:values]).to be_a Hash
  end
end

describe "Res::IR#values" do

  describe "Results at the top level in IR" do
    
    f = File.open(TMP_FILE + '-top', "w")
    f.write(
      <<eos
{
    "type": "Cucumber",
    "started": "2016-05-16 10:13:35 +0100",
    "finished": "2016-05-16 10:16:49 +0100",
    "values": { "a": 1, "b": 2},
    "results": []
}
eos
    )
    f.close

    it "identifies values at the top level" do
      ir = Res::IR.load(TMP_FILE + '-top')
      expect( ir.values ).to eq( { "a" => 1, "b" => 2 } )
    end

  end

  describe "Results at any level in IR" do

    f = File.open(TMP_FILE + '-mixed', "w")
    f.write(
      <<eos
{
    "type": "Cucumber",
    "started": "2016-05-16 10:13:35 +0100",
    "finished": "2016-05-16 10:16:49 +0100",
    "values": { "x": 1 },
    "results": [
      {
      "values": { "y": 2 },
      "status": "passed",
      "children": [
        {
        "values": { "z": 3 },
        "status": "failed"
        }
      ]
      },
      {
        "name": "two",
        "status": "failed"
      }
    ]
}
eos
    )
    f.close

    it "identifies values at the top level" do
      ir = Res::IR.load(TMP_FILE + '-mixed')
      expect( ir.values ).to eq( { "x" => 1, "y" => 2, "z" => 3 } )
    end


  end

end
