.PHONY: docker
docker: Dockerfile
	docker build -f $< .
