action :create do
  ruby_block "create rvm gem wrappers" do
    block do
      Dir.glob("/usr/local/rvm/gems/#{new_resource.ruby_string}/bin/*").each do |file_path|
        gem_binary = ::File.basename file_path
        if not ::File::exists? "/usr/local/rvm/bin/#{gem_binary}"
          system("rvm wrapper #{new_resource.ruby_string} --no-prefix #{gem_binary}")
        end
        if not ::File::exists? "/usr/bin/#{gem_binary}"
          FileUtils.ln_s("/usr/local/rvm/bin/#{gem_binary}","/usr/bin/#{gem_binary}")
        end
      end
    end
    action :create
  end
end
