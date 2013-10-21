go: setup run

setup:
	npm install

run:
	node app.js

clean:
	rm -rf node_modules

static:
	# this requires the app to be running
	-rm -r /tmp/generated
	cp -rv public /tmp/generated
	curl http://localhost:3000 > /tmp/generated/index.html
	git stash
	-git checkout gh-pages && \
		cp -rv /tmp/generated/* . && \
		git add . && \
		git commit -a -m "Creating static content for pages." && \
		git push -ff
	git checkout -

