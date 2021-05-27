    LOCATION=Waterloo,Belgium
    SEP1="["
    SEP2="]"
    DATA=$(curl -s wttr.in/$LOCATION?format=1 | grep -o ".[0-9].*")
    xsetroot -name "${SEP1}${DATA}${SEP2}"
