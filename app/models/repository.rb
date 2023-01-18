class Repository < ApplicationRecord
	include Github
	before_save { self.language = language.titleize }
	before_save { self.category = category.titleize }

	before_save :query_github_repo_stats

	def query_github_repo_stats
		uri = URI(self.public_url).path.split('/')
		owner = uri[1]
		repo_name = uri[2]
		repo = ::Github::Repository.find(repo_name, owner)
		
		self.title = repo_name
		self.stargazerCount = repo.stargazer_count
		self.forkCount 		= repo.fork_count
		self.lastUpdatedAt  = repo.updated_at
	end
end
