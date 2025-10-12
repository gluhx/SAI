#!/bin/bash
echo "00-preparing" > installing_log.txt
sqlplus SYS/root@//localhost:1521/FREE as SYSDBA @00-preparing.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "01-authrization" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @01-authrization.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "02-technologist" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @02-technologist.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "03-technologist-filling" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @03-technologist-filling.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "04-engineer" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @04-engineer.sql
grep . log_temp.txt >> installing_log.txt
echo '' >> installing_log.txt

echo "05-engineer-filling" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @05-engineer-filling.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "06-engineer-help" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @06-engineer-help.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "07-director" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @07-director.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "08-director-filling" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @08-director-filling.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "09-expert" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @09-expert.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "10-expert-filling" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @10-expert-filling.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "11-communication" >> installing_log.txt
sqlplus admin_user/root1@//localhost:1521/FREE @11-communication.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

echo "12-create-users" >> installing_log.txt
sqlplus SYS/root@//localhost:1521/FREE as SYSDBA @12-create-users.sql
grep . log_temp.txt >> installing_log.txt
echo '\n' >> installing_log.txt

rm log_temp.txt

clear

echo "----------------- Вывод ошибок развёртывания -------------------"
echo "" > errors.txt
count=$(grep -c . installing_log.txt)
for (( i=1; i <= $count; i++ ))
do
    line=$(head -$i installing_log.txt | tail -1)
    if [[ $line == *"ORA"* ]]; then
        echo " " >> errors.txt
        for (( a=i-3; a <= i; a++))
        do
            head -$a installing_log.txt | tail -1 >> errors.txt
        done
    fi
done

size=$(ls -lah errors.txt |cut -d ' ' -f 5)
if [ $size == 1 ];  
then
    echo "Ошибок при развёртывании не было обнаружено"
    rm errors.txt
else
    cat errors.txt | grep ORA
    echo "За подробностями обращайтесь в файл errors.txt"
    echo "Если вы разварачивайте эту БД в первый развозможен вывод ошибок удаления элементов." >> errors.txt
    echo "В этом случае разверните БД ещё раз." >> errors.txt
fi
echo "----------------------------------------------------------------"
