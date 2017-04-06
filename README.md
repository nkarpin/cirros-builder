# cirros-builder

## Usage

`docker build -t cirros-builder .`

`docker run --privileged -i -v $BUILD_DIR:/opt/build -v $OUTPUT_DIR:/opt/images -t cirros-builder`
