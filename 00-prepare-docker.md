Внимание, у тебя должен быть установлен Docker (или Docker Desktop)

1. Запусти команду в терминале:

```
docker run -d -p 30080:80 -p 22:22 --name centos --privileged rotorocloud/centos9s-sysd-ssh-master:moon-devstr01-scriptscourse
```

1а. После перезагрузки хостовой системы запусти контейнер `centos` из GUI или командой из терминала:

```
docker restart centos
```

2. Подключись к контейнеру командой:

```
ssh moon@localhost
```

ИЛИ

```
docker exec -it centos bash
```

В случае ssh используй пароль `selena`

В некторых установках пароль может не принимать. Это проблемы реализации docker в разных ОС.
Известные трудности/решения:
- Docker Desktop for Windows. В настройках установить галочку `Add the *.docker.internal names to the host's /etc/hosts file (Requires password)`

  после этого можно подключаться как `ssh moon@host.docker.internal -p 22`

3. Лабораторные находятся в папке `/labs`. Для начала внутри linux-консоли запусти файл `start.sh` для выбранной лабораторной.

Т.е. переходим в каталог `/labs` и там видим несколько директорий. Каждая директория отвежает за отдельную лабораторную.

Если мы хотим запустить лабораторную `02-01-first-script`, то делаем 
```
cd /labs
cd 02-01-first-script
./start.sh
```

Альтернативно, отдельная команда для лабораторной `02-01-first-script` будет:

```
/labs/02-01-first-script/start.sh
```

Внимание, не забудь вернуться в директорию `/home/moon` и именно в ней создавать свои скрипты, поскольку система проверки ожидает их там.
