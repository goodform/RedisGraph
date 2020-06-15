all:
	$(MAKE) -C ./src all

clean:
	$(MAKE) -C ./src $@

package: all
	$(MAKE) -C ./src package
.PHONY: package

docker:
	docker build . -t goodform/redisgraph

docker_push: docker
	docker push goodform/redisgraph:latest

builddocs:
	mkdocs build

localdocs: builddocs
	mkdocs serve

deploydocs: builddocs
	mkdocs gh-deploy

test:
	$(MAKE) -C ./src test
