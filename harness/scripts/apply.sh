function apply() {
    if [ ! -f "go.mod" ]; then
        rsync --exclude='*.twig' -a ".my127ws/application/skeleton/" .
    fi

    rsync --exclude='*.twig' -a ".my127ws/application/overlay/" .
}

apply
