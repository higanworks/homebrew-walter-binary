require 'open-uri'
require 'octokit'
require 'logger'

client = Octokit::Client.new
logger = Logger.new($stdout)

releases = client.releases('walter-cd/walter/releases')
archives_path = File.expand_path('../archives', __FILE__)

desc 'download all archives which was builded for darwin.'
task :download do
  releases.map do |r|
    FileUtils.mkdir_p(File.join(archives_path, r.tag_name))

    assets = r.assets.select {|b| b.name.match(/darwin/)}
    assets.map do |asset|
      local_filepath = File.join(archives_path, r.tag_name, asset.name)
      if File.exists?(local_filepath)
        logger.info "Skipped: Already exist #{local_filepath}."
      else
        File.open(local_filepath, 'wb') do |lf|
          open(asset.browser_download_url, 'rb') do |rf|
            logger.info "Getting: Remote file #{asset.browser_download_url} to #{local_filepath}"
            lf.write(rf.read)
          end
        end
      end
    end
  end
end
