#!/bin/bash

id=$1

echo "(GET) all"
odpowiedz=$(curl -s -w "%{http_code}" http://localhost:8000/produkty)
kod=${odpowiedz:(-3)}

if [ "$kod" -eq 200 ]; then
    echo "GET all sukces kod: $kod"
    echo "Tresc:"
    echo "${odpowiedz::-3}"
else
    echo "GET all porazka kod: $kod"
fi
echo ""

echo "(POST)"
odpowiedz=$(curl -s -w "%{http_code}" -X POST -H "Content-Type: application/json" -d '{"nazwa":"Produkt 1","cena":10,"ilosc":100}' http://localhost:8000/produkty)
kod=${odpowiedz:(-3)}

if [ "$kod" -eq 200 ]; then
    echo "POST sukces kod: $kod"
    echo "Tresc:"
    echo "${odpowiedz::-3}"
else
    echo "POST porazka kod: $kod"
fi
echo ""

echo "(GET) one"
odpowiedz=$(curl -s -w "%{http_code}" http://localhost:8000/produkty/$id)
kod=${odpowiedz:(-3)}

if [ "$kod" -eq 200 ]; then
    echo "GET one sukces kod: $kod"
    echo "Tresc:"
    echo "${odpowiedz::-3}"
else
    echo "GET one porazka kod: $kod"
fi
echo ""

echo "(PUT)"
odpowiedz=$(curl -s -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"nazwa":"Updated Produkt","cena":20,"ilosc":200}' http://localhost:8000/produkty/$id)
kod=${odpowiedz:(-3)}

if [ "$kod" -eq 200 ]; then
    echo "PUT sukces kod: $kod"
    echo "Tresc:"
    echo "${odpowiedz::-3}"
else
    echo "PUT porazka kod: $kod"
fi
echo ""

echo "(DELETE)"
odpowiedz=$(curl -s -w "%{http_code}" -X DELETE http://localhost:8000/produkty/$id)
kod=${odpowiedz:(-3)}

if [ "$kod" -eq 200 ]; then
    echo "DELETE sukces kod: $kod"
    echo "Tresc:"
    echo "${odpowiedz::-3}"
else
    echo "DELETE porazka kod: $kod"
fi
echo ""
