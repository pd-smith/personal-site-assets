#!/bin/sh
mkdir ./github-cache
curl 'https://api.github.com/users/pd-smith/repos' -H 'Accept: application/vnd.github.mercy-preview+json' > ./github-cache/github-repos.json

jq -c '.[]' github-cache/github-repos.json | while read i; do
  repoName=$(echo $i | jq -r '.name')
  languagesUrl=$(echo $i | jq -r '.languages_url')
  mkdir ./github-cache/$repoName
  curl $languagesUrl -H 'Accept: application/vnd.github.mercy-preview+json' > ./github-cache/$repoName/languages.json

done