
assertEqual() {
    if [ -z "$1" ]; then
        echo "assertEqual requires at least one operand"
        exit 1
    fi
    if [ "$1" != "$2" ]; then
        echo "$1 != $2"
        exit 1
    fi
}


# local variable a is not visible in the global scope
demoLocalVariable() {
    local var="HOME"
    echo "${var}"
}

# read:
# http://mywiki.wooledge.org/BashFAQ/048#line-120
# this can cause problem:
# https://stackoverflow.com/questions/33775996/circular-name-reference
localNameReference() {
    # evaluate the content of right-hand-side, using it to look up 
    # another variable; 
    # if the look up is successful the value of the target variable
    # is set to var
    # otherwise var is an empty string
    local -n var="HOME"
    echo "+ ${var}"
    local -n novar="BLABLA"
    echo "- ${novar}"
}

demoPassingArgs() {
    if [ -z "$1" ]; then
        echo "missing argument 1"
        exit 1
    fi
    if [ -z "$2" ]; then
        echo "missing argument 2"
        exit 1
    fi
}


# modify the output parameter
demoReturnValue() {
    local result=$1
    eval $result=100
}


run() {
    demoLocalVariable
    localNameReference

    demoPassingArgs "a" "b"
    
    local computed=1
    demoReturnValue computed
    assertEqual 100 $computed
}


run


if [ "$a" = "a" ]; 
then
    echo "a is in global scope"
    exit 1
fi
