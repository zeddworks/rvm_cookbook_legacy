action :create do
  ruby_block "create rvm gem wrappers" do
    block do

      require 'rubygems'
      require 'rvm'

      if new_resource.gemset.nil?
        environment = "#{new_resource.ruby_string}"
      else
        environment = "#{new_resource.ruby_string}@#{new_resource.vemset}"
      end

      current=RVM::Environment.current

      Dir.glob("/usr/local/rvm/gems/#{environment}/bin/*").each do |file_path|
        gem_binary = ::File.basename file_path
        unless ::File.exists? "/usr/local/rvm/wrappers/#{environment}/#{gem_binary}"
          current.rvm :wrapper, environment, "--no-prefix", gem_binary
        end
        unless ::File.symlink? "/usr/bin/#{gem_binary}"
          FileUtils.ln_s("/usr/local/rvm/wrappers/#{environment}/#{gem_binary}","/usr/bin/#{gem_binary}")
        end
      end

    end
    action :create
  end
end
