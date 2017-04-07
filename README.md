# cirros-builder

## Usage

`mkdir src-cirros`

`git clone https://git.launchpad.net/~cirros-dev/cirros ./src-cirros`

`docker build -t cirros-builder .`

`docker run --privileged -i -v $OUTPUT_DIR:/opt/images -t cirros-builder`
