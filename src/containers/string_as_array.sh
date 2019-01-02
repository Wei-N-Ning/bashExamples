
# find in canva infra codebase

# turn the results of find and ls into a bash array
ls_files_as_array() {
    local a=( $(ls /tmp) )
    for eac in "${a[@]}"
    do
        echo -n "."
    done
    echo "${#a[@]}"
}

find_files_as_array() {
    local root=$(git rev-parse --show-toplevel)
    local a=( $(find "${root}" -name "*.sh") )
    echo "${#a[@]}"
}

ls_files_as_array
find_files_as_array


