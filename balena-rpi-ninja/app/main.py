import os, subprocess

NINJA_SCRIPT_PATH='raspberry_ninja/publish.py'

if __name__ == '__main__':

    stream_script = ['python3', NINJA_SCRIPT_PATH]
    stream_params = []

    if 'stream_id' in os.environ:
        stream_params.extend(['--streamid', os.environ['stream_id']])

    if 'stream_params' in os.environ:
        stream_params.extend(eval(os.environ['stream_params']))

    stream_script.extend(stream_params)
    print('stream script:', stream_script)

    subprocess.call(stream_script)

