# README

- `git clone https://github.com/ghostdotted/m1-backend-task.git`
- `cd m1-backend-task`
- `bundle install`
- `rails db:migrate`
- `export GITHUB_ACCESS_TOKEN="<check submission notes>"`
- `rails db:seed`
- `rails s`

Input: (db/seed.rb) 

Application List: http://localhost:3000/repositories

New Repo: http://localhost:3000/repositories/new

Language List: http://localhost:3000/repositories/Ruby/category

Detailed Category: http://localhost:3000/repositories/Ruby?category=Auth

- The main things to note that are outstanding from the task are the URL schemes. I chose to stick to rails conventions rather than scope of the task to produce the URL structures below. Given the scope of the assignment and more time spent, I would fix the “/category” page to “show” the categories without needing a separate URL.



- The Github GraphQL Query can be found in 'lib/Github.rb' and 'models/repository.rb'
- The repository controller could use some cleanup associated with the notes I mentioned aligned with the URL schema and routes.
- The before_save filter is more a quick way to add the external Github API stats rather than a quality way.
