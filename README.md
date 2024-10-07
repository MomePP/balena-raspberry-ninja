# balena-raspberry-ninja

Example to showcase Raspberry Pi Foundation's new camera stack based on `libcamera`
- this was modified `Dockerfile` from example to runs `raspberry_ninja` with `BalenaOS` to managed deploy devices on cloud dashboard.


[![balena deploy button](https://www.balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/momepp/balena-raspberry-ninja.git)

## Development Notes

### Prerequisites
- `raspberry pi 5` working with raspberry pi's camera module 3. (using libcamera)
- `balena-cli`, required if needed to releases new service version.

### Balena Commands
- push new release to gogo-remote-lab's balena fleet
    ``` sh
    balena push g_gogo_remote_lab/remote-labs
    ```

### Balena Configurations
- Fleets variables
    - `stream_id` : `vdo-ninja` stream id, must be overrided per device. default to `vdo.ninja-id` which idle the process.
    - `stream_params` : `vdo-ninja` stream parameters. default to `['--framerate', '50', '--noaudio', '--multiviewer', '--libcamera']`

- Device config variables
in case of other rpi hardware with difference variants. it must be configures with some modification on `applicationConfigVariables`.

### Application Services
- `gogo-remote-ninja`: the main application service to stream video feed using `rpi-ninja`.
- `restart-service`: the restart service to keep `gogo-remote-ninja` hangs on unexpected event. which can be adjust the restart timer in `./docker-compose.yml`
