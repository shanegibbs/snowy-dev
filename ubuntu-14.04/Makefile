BUILD=$(shell pwd)/.build
COMMON=$(shell pwd)/../common

default:
	rm -rf $(BUILD)
	mkdir -p $(BUILD)
	cp -aR $(COMMON) $(BUILD)
	echo FROM ubuntu:14.04 > $(BUILD)/Dockerfile
	cat $(COMMON)/Dockerfile.tail >> $(BUILD)/Dockerfile
	sudo docker build -t shanegibbs/snowy-dev:14.04 $(BUILD)
