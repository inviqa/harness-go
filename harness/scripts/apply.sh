function apply() {
    if [ ! -f "go.mod" ]; then
        rsync --exclude='*.twig' --exclude='_twig' -a ".my127ws/application/skeleton/" .
    fi
}

apply
