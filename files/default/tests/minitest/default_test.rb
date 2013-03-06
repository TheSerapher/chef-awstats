# Copyright 2012, Sebastian Grewe <sebastian@grewe.ca>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require File.expand_path('../support/helpers', __FILE__)

describe "awstats::default" do
  include Helpers::VsftpdTest

  it 'should return 200 and not be a perl script on http://localhost/awstats/awstats.pl' do
    uri = URI.parse("http://localhost/awstats/awstats.pl")

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    response.code.must_match(/200/)
    response.body[0,20].wont_match(/#!.*\/bin\/perl/)
  end
end
