NAME := activiti-cloud-application-chart
OS := $(shell uname)

ACTIVITI_CLOUD_DEPENDENCIES_ARTIFACT_ID := activiti-cloud-dependencies
QUERY_ACTIVITI_CLOUD_DEPENDENCIES_VERSION := 7.0.0
AUDIT_ACTIVITI_CLOUD_DEPENDENCIES_VERSION := 7.0.0
CONNECTOR_ACTIVITI_CLOUD_DEPENDENCIES_VERSION := 7.0.0
RB_ACTIVITI_CLOUD_DEPENDENCIES_VERSION := 7.0.0

DEPENDENCIES_VERSIONS := ${QUERY_ACTIVITI_CLOUD_DEPENDENCIES_VERSION} ${AUDIT_ACTIVITI_CLOUD_DEPENDENCIES_VERSION} ${CONNECTOR_ACTIVITI_CLOUD_DEPENDENCIES_VERSION} ${RB_ACTIVITI_CLOUD_DEPENDENCIES_VERSION}

validate:
	@echo "Validating dependencies to match ${ACTIVITI_CLOUD_DEPENDENCIES_ARTIFACT_ID} same versions..."
	$(eval RESULT := $(subst ${QUERY_ACTIVITI_CLOUD_DEPENDENCIES_VERSION},,${DEPENDENCIES_VERSIONS}))
	$(if $(strip $(RESULT)), \
		@echo "Found entries in ${DEPENDENCIES_VERSIONS} with different versions"; exit 1, \
		@echo "All versions match to ${QUERY_ACTIVITI_CLOUD_DEPENDENCIES_VERSION}" \
	)

all: build

check: build test

build:
	echo "do nothing"

test: 
	echo "do nothing"

install:
	echo "do nothing"

clean:
	rm -rf build release

linux:
	echo "do nothing"

.PHONY: release clean
