
# find in canva infra codebase

demo() {
    local a=( $(ls /tmp) )
    for eac in "${a[@]}"
    do
        echo ${eac}
    done
}

demo
