#!/bin/bash

logfile="logfile.txt"
attivita_in_corso=()

if [[ ! -f "$logfile" ]]; then
  touch "$logfile"
fi

if [[ -s "$logfile" ]]; then
  ultima_data=$(grep -oP '^\d{4}-\d{2}-\d{2}' "$logfile" | tail -n 1)
else
  ultima_data=""
fi

echo -e "\n------------------ Ultime attività registrate ------------------"
if [[ -s "$logfile" ]]; then
  tail "$logfile"
else
  echo "Nessuna attività registrata."
fi
echo -e "----------------------------------------------------------------\n"

echo "[ INSERT ]  Digita per inserire un'attività."
echo "[ RANGE ]   Digita 'start <attività>' e 'end <attività>'."
echo "[ REMOVE ]  Premi 'r' per eliminare l'ultima attività."
echo "[ DISPLAY ] Premi 'd' per mostrare il log."
echo -e "[ QUIT ]    Premi 'q' per terminare.\n"

while true; do
  echo -n "➞️ "
  read scelta

  case "$scelta" in
    "q")
      echo "Salvato in $logfile."
      break
      ;;
    "d")
      echo -e "\n------------------ Ultime attività registrate ------------------"
      if [[ -s "$logfile" ]]; then
        tail "$logfile"
      else
        echo "Nessuna attività registrata."
      fi
      echo -e "----------------------------------------------------------------\n"
      ;;
    "r")
      if [[ -s "$logfile" ]]; then
        sed -i '$d' "$logfile"
        echo "Ultima attività eliminata dal log."
      else
        echo "Il log è vuoto. Nessuna attività da eliminare."
      fi
      ;;
    "start"*)
      attivita_nome="${scelta#start }"
      ora_corrente=$(date '+%H:%M')
      attivita_in_corso+=("$attivita_nome")
      echo "$ora_corrente - (--:--) $attivita_nome" >> "$logfile"
      echo "Attività '$attivita_nome' registrata con orario di inizio: $ora_corrente"
      ;;
    "end"*)
      attivita_nome="${scelta#end }"
      if [[ " ${attivita_in_corso[@]} " =~ " ${attivita_nome} " ]]; then
        ora_corrente=$(date '+%H:%M')
        sed -i "/$attivita_nome/ s/(--:--)/$ora_corrente/" "$logfile"
        echo "Attività '$attivita_nome' registrata con orario di fine: $ora_corrente"
        attivita_in_corso=("${attivita_in_corso[@]/$attivita_nome}")
      else
        echo "Nessuna attività '$attivita_nome' in corso."
      fi
      ;;
    *)
      data_corrente=$(date '+%d/%m/%Y')
      ora_corrente=$(date '+%H:%M')
      if [[ "$data_corrente" != "$ultima_data" ]]; then
        echo "$data_corrente" >> "$logfile"
        ultima_data="$data_corrente"
      fi
      echo "$ora_corrente - $scelta" >> "$logfile"
      echo "Attività registrata"
      ;;
  esac
done
