.PHONY: build test
deploy:
	cp CNAME build && \
	git push -d origin gh-pages || true && \
	git subtree push --prefix build origin gh-pages
build:
	bundle exec jekyll docs
test:
	bundle exec jekyll serve --watch
push:
	rsync -avz --delete _site/ user@netsys.cs.berkeley.edu:https://csge.berkeley.edu/
