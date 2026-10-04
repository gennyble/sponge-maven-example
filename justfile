target-dir := justfile_directory() + "/target"

# Get a specific <TAG>{data}</tag> from the pom.xml file.
# IDX is *which* of the <TAG> we are taking, as there might be multiple
get-pom TAG IDX="1":
	@sed -En "s/.*<{{ TAG }}>(.*)<\\/{{ TAG }}>/\\1/p" pom.xml | awk 'NR=={{ IDX }}'

# NOTE: This only works if your <artifactId> amd <version> appear before any
# other tags with those names. It is fine for the pom.xml in this repository
package-name:
	@echo "$(just get-pom artifactId)-$(just get-pom version).jar"

info:
	#!/bin/bash
	artifactId=$(just get-pom artifactId)
	version=$(just get-pom version)
	echo "===== Parsed from pom.xml ====="
	echo "Artifact ID: $artifactId"
	echo "Version:     $version"
	echo "Package:     $artifactId-$version.jar"

package:
	mvn package

unpack: package
	#!/bin/bash
	rm -rf "{{ target-dir }}/unpacked"
	mkdir -p "{{ target-dir }}/unpacked"
	cd "{{ target-dir }}/unpacked"
	unzip "{{ target-dir }}/$(just package-name)"
