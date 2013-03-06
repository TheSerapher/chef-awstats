require 'chefspec'

describe 'The recipe awstats::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'awstats::default' }

  it 'should do something' do
    pending 'Add recipe examples here'
  end
end
