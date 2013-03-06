Description [ ![Codeship Status for TheSerapher/chef-awstats](https://www.codeship.io/projects/434832e0-6884-0130-7230-22000a8c4a68/status?branch=master)](https://www.codeship.io/projects/1790) 
===========

Installs and configures awstats for Apache.
Requirements
============

## Platform:

* Ubuntu
* Debian
* CentOS
* RHEL

## Cookbooks:

* apache2
* yum

Attributes
==========

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['awstats']['reload_apache']</code></td>
    <td>Reload apache if the apache configuration changes</td>
    <td><code>true</code></td>
  </tr>
</table>

Recipes
=======

## awstats::default

Installs/configures awstats

Testing
=======

The cookbook comes with some testing facilities allowing you to iterate quickly
on cookbook changes.

## Rake

You can execute the tests with [Rake](http://rake.rubyforge.org). The `Rakefile`
provides the following tasks:

    $ rake -T
    rake chefspec    # Run ChefSpec examples
    rake foodcritic  # Run Foodcritic lint checks
    rake knife       # Run knife cookbook test
    rake test        # Run all tests

## Bundler

If you prefer to let [Bundler](http://gembundler.com) install all required gems
(you should), run the tests this way:

    $ bundle install
    $ bundle exec rake test

## Berkshelf

[Berkshelf](http://berkshelf.com) is used to set up the cookbook and its
dependencies (as defined in `Berksfile`) prior to testing with Rake and Vagrant.

## Vagrant

With [Vagrant](http://vagrantup.com), you can spin up a virtual machine and run
your cookbook inside it via Chef Solo.

This command will boot and provision the VM as specified in the
`Vagrantfile`:

    $ bundle exec vagrant up <name>

Name refers to any box setup by `test-kitchen`, see below.

(Berkshelf's Vagrant plugin will make your cookbook and its dependencies
automatically available to Vagrant when creating or provisioning a VM.)

## Kitchen

This cookbook is using [test-kitchen](https://github.com/opscode/test-kitchen)  to propagate
the `Vagrantfile`. You can review the boxes by using:

    $ bundle exec kitchen list

Each item in this list is a regular vagrant box that can be started as
usual.

To run the full kitchen suite included in this cookbook simply execute:

    $ bundle exec kitchen test

License and Author
==================

Author:: Sebastian Grewe (<sebastian.grewe@gmail.com>) 

Copyright:: 2013, Sebastian Grewe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
