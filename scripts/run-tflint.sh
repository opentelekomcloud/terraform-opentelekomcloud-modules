#!/usr/bin/env bash

function tfAllLint {
  echo "==> Checking that terraform blocks are properly formatted..."

files=$(find . -type f -name "*.tf")
error=false

for f in $files; do
  terrafmt diff -c -q -f "$f" || error=true
done

if ${error}; then
  echo "------------------------------------------------"
  echo ""
  echo "The preceding files contain terraform blocks that are not correctly formatted or contain errors."
  echo "You can fix this by running make tools and then terrafmt on them."
  echo ""
  echo "to easily fix all terraform blocks:"
  echo "$ make tffmtfix"
  echo ""
  echo "format only acceptance test config blocks:"
  echo "$ find . | egrep \".tf\" | sort | while read f; do terrafmt fmt -f \$f; done"
  echo ""
  echo "format a single test file:"
  echo "$ terrafmt fmt -f ./modules/vpc/main.tf"
  echo ""
  exit 1
fi

}

function main {
  tfAllLint
}

main
