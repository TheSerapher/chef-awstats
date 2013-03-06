require 'chefspec'

describe 'The recipe awstats::default' do
  %w( rhel debian ).each do |platform_family|
    describe "for #{platform_family}" do
      let(:chef_run) {
        chef_run = ChefSpec::ChefRunner.new
        chef_run.node.set['platform_family'] = platform_family
        chef_run.converge 'awstats::default'
      }

      %w( awstats::_dependencies awstats::_install awstats::_configure apache2::mod_cgi ).each do |rcp|
        it "should include_recipe #{rcp}" do
          chef_run.should include_recipe rcp
        end
      end

      it 'should include_recipe yum::rpmforge' do
        chef_run.should include_recipe 'yum::repoforge'
      end if platform_family == 'rhel'

      platform_family == 'debian' ? packages = [ 'awstats', 'libgeo-ip-perl' ] : packages = [ 'awstats', 'perl-Geo-IP' ]

      packages.each do |pkg|
        it "should install package #{pkg}" do
          chef_run.should install_package pkg
        end
      end

      it 'should create awstats.conf and reload apache' do
        chef_run.should create_file chef_run.node['apache']['dir'] + '/conf.d/awstats.conf'
        chef_run.template(chef_run.node['apache']['dir'] + '/conf.d/awstats.conf').should notify 'service[apache2]', 'reload'
      end
    end
  end
end
