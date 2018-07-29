#!/usr/bin/env bash

# source
# https://en.wikipedia.org/wiki/Here_document

# to allow substituteion use << EOF 
# to disallow substitution use << "EOF"
password="thereis acow"

heredoc_variable() {
    local text=$( cat << EOF
new line
another line
third line!
${password}
EOF
)
    # note the newline characters are removed
    echo ${text}
}

# to implement the before/after source extraction function
heredoc_perl_oneliner() {
    local oneliner=$( cat << "EOF"
if (/doom/) {
    $start++;
}
if ($start || 0) {
    print "\${password}";
    print $_;
}
EOF
)
    echo "
dune
dune 2
doom
doom 2
doom 3, 2003
" | perl -lne "${oneliner}"

}

heredoc_variable
heredoc_perl_oneliner
