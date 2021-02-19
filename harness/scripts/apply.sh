function apply() {
    if [ ! -f "main.go" ]; then
        rsync --exclude='*.twig' -a ".my127ws/application/skeleton/" .
    fi

    rsync --exclude='*.twig' -a ".my127ws/application/overlay/" .
}

apply
