
# posts:
# https://unix.stackexchange.com/questions/182537/write-python-stdout-to-file-immediately
# https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file

# bash version
python -c "import time,sys;[(time.sleep(0.1), sys.stdout.write('XXAA\n')) for i in xrange(0xA)]" >& /tmp/log.txt
cat /tmp/log.txt

# change stdbuf behavior
stdbuf -oL python -c "import time,sys;[(time.sleep(0.1), sys.stdout.write('XXAA\n')) for i in xrange(0xA)]" &> /tmp/log.txt

# change -oL to -eL to modify stderr buffering behavior 

# csh version (can't run it here)
# .... >& /tmp/log.txt

var=$( python -c "import sys;sys.stdout.write('doom_out');sys.stderr.write('doom_err')" 2>&1 )
# DO NOT expect the order to be doom_outdoom_err
echo $var
