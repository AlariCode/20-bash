car=Audi

case $car

  "Lada" | "UAZ")
    echo "${car} brand is from Russia."
    ;;

  "BMW" | "Mercedes" | "Audi")
    echo "${car} brand is from Germany."
    ;;

  "Tesla"
    echo "${car} brand is from USA."
    ;

  "Toyota" | "Mitsubishi" | "Subaru")
    echo "${car} brand is from Japan."
    ;;

  *)
    echo "${car} is an unknown car brand"


esac