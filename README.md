# sibsutis_soft_install
Скрипт для установка программного обеспечения, необходимого для кафедры ТСиВС СибГУТИ.
Включает в себя:
- настройку статического IP-адреса; ✅
- замена горячих клавиш на смену языка (Alt+Shift); ✅
- установку ssh; ✅
- замена зеркал Ubuntu на зеркала Yandex (/etc/apt/sources.list); ✅
- установка основных пакетов Qt5; ✅
- установка Libre Office 6.1; ✅
## Запуск

```sh
./network_settings.sh <номер аудитории> <номер компьютера>
#соответственно IP-адрес будет: 10.23.<номер аудитории>.<номер компьютера>
```
