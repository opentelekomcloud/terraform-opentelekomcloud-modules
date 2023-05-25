SHELL=/bin/bash

export PATH:=/usr/local/go/bin:~/go/bin/:$(PATH)

default: tffmtfix

tools:
	@echo "==> installing required tooling..."
	go install github.com/katbyte/terrafmt@latest

tffmtfix: tools
	@echo "==> Fixing modules terraform blocks code with terrafmt..."
	@find ./ -type f -name "*.tf" | sort | while read f; do terrafmt fmt -f $$f; done
	@echo "==> Fixing docs terraform blocks code with terrafmt..."
	@find ./ -type f -name "*.md" | sort | while read f; do terrafmt fmt $$f; done

tflint: tools
	./scripts/run-tflint.sh
