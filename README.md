# cirros-builder

## Usage

`mkdir src-cirros`

`git clone https://git.launchpad.net/~cirros-dev/cirros ./src-cirros`

`docker build -t cirros-builder .`

Edit configuration file `config` with needed options. And run:

`docker run --privileged --env-file config -i -v $OUTPUT_DIR:/opt/images -t cirros-builder`

$OUTPUT_DIR - directory of the host where image should be placed.