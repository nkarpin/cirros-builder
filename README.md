# cirros-builder

## Usage

`mkdir src-cirros`

`git clone https://git.launchpad.net/~cirros-dev/cirros ./src-cirros`

`docker build -t cirros-builder .`

Edit configuration file `config` with needed options. Docker container could be launched in privileged mode:

`docker run --privileged --env-file config -i -v $OUTPUT_DIR:/opt/images -t cirros-builder`

or with SYS_ADMIN capability, in this case free loop host device should be found before:

`FREE_LOOP_DEV=$(sudo losetup -f)`

`docker run --cap-add SYS_ADMIN --security-opt apparmor:unconfined --device=${FREE_LOOP_DEV} --env-file config -i -t -v $OUTPUT_DIR:/opt/images cirros-builder`

$OUTPUT_DIR - directory of the host where image should be placed.