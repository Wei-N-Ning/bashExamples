
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
    local var="a"
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
