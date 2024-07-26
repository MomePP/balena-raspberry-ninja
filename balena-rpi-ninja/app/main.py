import os, subprocess

NINJA_SCRIPT_PATH='raspberry_ninja/publish.py'

if __name__ == '__main__':

    stream_script = ['python3', NINJA_SCRIPT_PATH]
    stream_params = []

    if not 'stream_id' in os.environ or os.environ['stream_id'] == 'vdo.ninja-id':
        print("error: stream_id is not set in environment variable")
        exit(1)
    
    stream_params.extend(['--streamid', os.environ['stream_id']])

    if 'stream_params' in os.environ:
        stream_params.extend(eval(os.environ['stream_params']))

    stream_script.extend(stream_params)
    print('stream script:', stream_script)

    subprocess.run(stream_script)

