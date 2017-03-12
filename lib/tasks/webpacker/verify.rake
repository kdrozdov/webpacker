require "webpacker/configuration"

namespace :webpacker do
  namespace :install do
    desc "Verify if webpacker is installed and package.json is in place"
    task :verify do
      begin
        webpacker_config = Webpacker::Configuration.webpacker
        File.read(Rails.root.join(webpacker_config[:configPath], "shared.js"))
      rescue Webpacker::Configuration::NotFoundError, NoMethodError, Errno::ENOENT
        puts "Webpack core config not found in package.json or package.json is missing. \n"\
             "Make sure webpacker:install is run successfully before " \
             "running dependent tasks"
        exit!
      end
    end
  end
end