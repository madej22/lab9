# Laboratorium 9. Docker Compose – podstawy konfiguracji aplikacji wielokontenerowych
Kacper Madejczyk, 92937, TI6.2

Przy pomocy pliku `docker-compose.yml` można utworzyć stos LEMP z 4 kontenerami: Nginx, PHP, MySQL, phpMyAdmin.

## Konfiguracja kontenera *nginx*
- Kontener ma zamontowany przez bind mount folder `nginx` na `/etc/nginx/conf.d`.
- Konfiguracja serwera nginx znajduje się w pliku `conf.d`, pozwala ona na połączenie się z kontenerem php.
- Kontener jest podłączony do sieci `backend` i `frontend`, ma skonfigurowane przekierowywanie portu z 8000 na 80 (port 6666 z treści zadania nie chciał działać).

## Konfiguracja kontenera *php*
- Kontener ma zamontowany przez bind mount folder `files` w `/var/www/html`. Znajduje się w nim plik `index.php`, który przy pomocy instrukcji phpinfo(); wyświetla informacje o PHP.
- Kontener jest podłączony do sieci `backend` i ma skonfigurowane przekierowywanie portu z 9000 na 9000.

## Konfiguracja kontenera *mysql*
- Kontener posiada wolumen `mysql_vol` zamontowany w lokalizacji `/var/lib/mysql`. Znajduje się tam zawartość bazy danych.
- Kontener jest podłączony do sieci `backend`.
- Kontener posiada skonfigurowaną zmienną środowiskową odpowiedzialną za hasło użytkownika root.

## Konfiguracja kontenera *phpmyadmin*
- Kontener posiada link do kontenera `mysql`.
- Kontener jest podłączony do sieci `backend` i ma skonfigurowane przekierowywanie portu z 6001 na 80.
