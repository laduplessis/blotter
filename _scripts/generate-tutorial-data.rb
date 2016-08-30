# Preprocessing script
# Run before `jekyll build` to go through _config.yml and use octokit to fill out metadata
#
# Example:
#  - repo: trvrb/coaltrace
#  - owner: trvrb
#  - title: coaltrace
#  - description: Simulating genealogies using charged particles
#  - url: /tutorials/coaltrace/
#  - date: 2013-10-19 04:12:17 UTC
#  - contributors:
#      - login: trvrb
#      - avatar: https://2.gravatar.com/avatar/ab7fe2db559c7924316c4391ba00b3f0
#      - url: https://github.com/trvrb
#  - commits:
#      - date: 2013-10-19T04:12:06Z
#      - message: Update readme.
#      - url: https://github.com/trvrb/coaltrace/commit/ebb95806f989d8fd6ecbf6aa8308647298dd21ad 

require 'octokit'
require 'yaml'

module Tutorials

	def self.generate_data(config_file)
	
		tutorial_data = {}
	
		config = YAML.load_file(config_file)
		tutorials_array = config["tutorials"]

		puts "Generating tutorials"
		# create octokit client
		client = Octokit::Client.new(:netrc => true, :access_token => ENV['GITHUB_TOKEN'])			

		tutorial_data = Array.new
		if tutorials_array.length > 0
			tutorials_array.each do |repo|
		
				puts "\tGenerating #{repo}"
			
				# load repo metadata
				octokit_repo = client.repository(repo)
				tutorial_title = octokit_repo.name
				tutorial_owner = octokit_repo.owner.login
				tutorial_description = octokit_repo.description
				tutorial_url = "/tutorials/#{tutorial_title}/"
				tutorial_date = octokit_repo.updated_at

				# Get all pdfs in the root
				pdf_array = Dir.glob("tutorials/#{tutorial_title}/*.pdf")
			
				# load contributor metadata
				octokit_contributors = client.contributors(repo)					
				tutorial_contributors = Array.new
				for i in 0 ... [octokit_contributors.size, 5].min
					contributor = octokit_contributors[i]					
					contributor_login = contributor.login
					contributor_avatar = contributor.rels[:avatar].href + "&s=50"
					contributor_url = contributor.rels[:html].href
					tutorial_contributors = tutorial_contributors.push(
						"login" => contributor_login,
						"avatar" => contributor_avatar,
						"url" => contributor_url
					)
				end
			
				# load commit metadata
				octokit_commits = client.commits(repo)
				tutorial_commits = Array.new		
				for i in 0 ... [octokit_commits.size, 5].min	
					commit = octokit_commits[i]		
					commit_date = commit.commit.author.date
					commit_message = commit.commit.message
					commit_url = commit.rels[:html].href
					if commit.author != nil then
						commit_author_login = commit.author.login
						commit_author_url = commit.author.rels[:html].href				
						tutorial_commits = tutorial_commits.push(
							"date" => commit_date,
							"message" => commit_message,
							"url" => commit_url,
							"author_login" => commit_author_login,							
							"author_url" => commit_author_url					
						)
					end
				
				end
			
				# assemble metadata
				tutorial_data = tutorial_data.push(
					"repo" => repo,
					"title" => tutorial_title,						
					"owner" => tutorial_owner,
					"description" => tutorial_description,
					"url" => tutorial_url,
					"contributors" => tutorial_contributors,
					"commits" => tutorial_commits,
					"pdfs" => pdf_array
				)
			
				# sort by date
				tutorial_data.sort! { |x, y| y["commits"].first["date"] <=> x["commits"].first["date"] } 
			
			end
		end
			
		return tutorial_data
			
	end
	
	def self.write_data(tutorial_data, data_file)
	
		puts "Writing tutorial data"			
		File.write(data_file, tutorial_data.to_yaml)
	
	end

end

tutorial_data = Tutorials.generate_data("_config.yml")
Tutorials.write_data(tutorial_data, "_data/tutorials.yml")
