require 'erb'

module Toquen
  module Bootstrapper
    def self.generate_script(host)
      # host is available via the binding
      hosttype = fetch(:hosttype, 'ubuntu')
      path = File.expand_path("../templates/#{hosttype}_bootstrap.erb", __FILE__)
      raise "Bootstrap process for #{hosttype} does not exist!" unless File.exists?(path)
      rubygems_version = fetch(:rubygems_version, '2.2.2')
      ruby_version = fetch(:ruby_version, '1.9.3')
      user = fetch(:ssh_options)[:user]
      StringIO.new ERB.new(File.read(path)).result(binding)
    end
  end
end
