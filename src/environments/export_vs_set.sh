#!/usr/bin/env bash
# source:
# http://hackjutsu.com/2016/08/04/Difference%20between%20set,%20export%20and%20env%20in%20bash/

# What’s the difference between set, export and env and when should we use each?

# key=value
# env key=value
# export key=value
# This is a repost from StackExchange ask Ubuntu community.

# Setting Variables
# Let us consider a specific example. The grep command uses an environment variable called GREP_OPTIONS to set default options.

# Now. Given that the file test.txt contains the following lines:
cat >/tmp/test.txt <<"EOF"
line one
line two
EOF

# running the command will return

grep one /tmp/test.txt

# line one
# If you run grep with the -v option, it will return the non-matching lines, so the output will be

# line two
# We will now try to set the option with an environmental variable.

# Environment variables set without export will not be inherited in the environment of the commands you are calling.

GREP_OPTIONS='-v'
grep one /tmp/test.txt
# The result:

# line one
# Obviously, the option -v did not get passed to grep.

# You want to use this form when you are setting a variable only for the shell to use, for example in for i in * ; do you do not want to export $i.

# However, the variable is passed on to the environment of that particular command line, so you can do

GREP_OPTIONS='-v' grep one /tmp/test.txt
# which will return the expected

# line two
# You use this form for temporarily change the environment of this particular instance of the program launched.

# Exporting variables
# Exporting a variable causes the variable to be inherited:

export GREP_OPTIONS='-v'
grep one /tmp/test.txt
# returns now

# line two
# This is the most common way of setting variables for use of subsequently started processes in a shell

# Env
# This was all done in bash. export is a bash builtin; VAR=whatever is bash syntax. env, on another hand, is a program in itself. When env is called, following things happen:

# 1. The command `env` gets executed as a new process
# 2. `env` modifies the environment, and
# 3. calls the command that was provided as an argument. The `env` process is replaced by the `command` process.
# Example:

env GREP_OPTIONS='-v' grep one /tmp/test.txt
# This command will launch two new processes: (i) env and (ii) grep (actually, the second process will replace the first one). From the point of view of the grep process, the result is exactly the same as running

# GREP_OPTIONS='-v' grep one test.txt
# However, you can use this idiom if you are outside of bash or don’t want to launch another shell (for example, when you are using the exec() family of functions rather than the system() call).

# Additional note on #!/usr/bin/env
# This is also why the idiom #!/usr/bin/env interpreter is used rather than #!/usr/bin/interpreter. env does not require a full path to a program, because it uses the execvp() function which searches through the PATH variable just like a shell does, and then replaces itself by the command run. Thus, it can be used to find out where an interpreter (like perl or python) “sits” on the path.

# It also means that by modifying the current path you can influence which python variant will be called. This makes the following possible:

cat >/tmp/sut <<"EOF"
#!/usr/bin/env python

print('fooo')
EOF
chmod a+x /tmp/sut

cat >/tmp/python <<"EOF"
echo "I am an evil interpreter!"
EOF
chmod a+x /tmp/python

export PATH=/tmp
/tmp/sut

# instead of launching Calibre, will result in

# I am an evil interpreter!