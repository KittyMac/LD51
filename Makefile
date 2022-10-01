SWIFT_BUILD_FLAGS=--configuration release

build:
	swift build -v $(SWIFT_BUILD_FLAGS)

update:
	swift package update

clean:
	rm -rf .build

test:
	swift test -v

docker:
	-docker buildx create --name local_builder
	-DOCKER_HOST=tcp://192.168.1.198:2376 docker buildx create --name local_builder --platform linux/amd64 --append
	-docker buildx use local_builder
	-docker buildx inspect --bootstrap
	-docker login
	docker buildx build --platform linux/amd64,linux/arm64 --push -t kittymac/ld51 .

docker-shell:
	docker pull kittymac/ld51
	docker run --rm -it --entrypoint bash kittymac/ld51

docker-run:
	docker pull kittymac/ld51
	docker run --publish published=8080,target=8080 kittymac/ld51 ./ld51 http

docker-service-log:
	-ssh rjbowli@192.168.1.198 "docker service logs --follow ld51-http"

docker-service-start:
	-ssh rjbowli@192.168.1.198 "docker service create --name ld51-http --constraint 'node.labels.sextant == true' --publish published=9083,target=8080,mode=host --with-registry-auth --mode global kittymac/ld51 ./LD51 http"
	
docker-service-stop:
	-ssh rjbowli@192.168.1.198 "docker service rm ld51-http"
	
docker-service-deploy: docker-service-stop docker-service-start
	echo "deployed"
    