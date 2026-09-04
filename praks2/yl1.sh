
#!/bin/bash
# Skript väljastab tervituse koos sisselogitud kasutaja nimega

echo -n "Tere, "
kasutaja=$(whoami)
echo -n "$kasutaja "
echo "!"
