if [[ -n "$1" ]]
then
salida=$(curl "https://pokeapi.co/api/v2/pokemon/$1")
if [[ -n "$salida" ]]
    then
    nombre=$(echo $salida | jq .name)
    orden=$(echo $salida | jq .order)
    id=$(echo $salida | jq .id)
    peso=$(echo $salida | jq .weight)
    altura=$(echo $salida | jq .height)

    echo "
    $nombre (NO. $orden)
    Id = $id
    Weight = $peso
    Height = $altura
    "

    echo "$id,$nombre,$peso,$altura,$orden" >> pokemon.csv
    else
    echo "Ese pokemon no existe"
    fi
else
echo "No se pasaron argumentos, inténtelo de nuevo escribiendo el nombre de un pokemon" 
fi
