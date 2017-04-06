# App Academy Homeworks

How to make fix authorship (from AAStudent to eadams17):

git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Eric Adams'; GIT_AUTHOR_EMAIL='erictayloradams@gmail.com'; GIT_COMMITTER_NAME='Eric Adams'; GIT_COMMITTER_EMAIL='erictayloradams@gmail.com';" HEAD

git push -f