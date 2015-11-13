require 'res'

describe Res.perf_data do
  cucumber_command = "unset BUNDLE_GEMFILE; unset RUBYOPT; cd examples/cucumber; bundle exec cucumber"
  it "Submit performance results to res" do
        `#{cucumber_command} features/performance.feature -f Res::Formatters::RubyCucumberLegacy -o out.res`
        ir = Res::IR.load("examples/cucumber/out.res")
        expect(ir.tests.first).to have_key(:value)
        expect(ir.tests.first[:value]).to be_a Hash
      end
end
