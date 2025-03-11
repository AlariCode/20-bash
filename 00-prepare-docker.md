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

3. Лабораторные находятся в папке `/labs`. Для начала внутри linux-консоли запусти файл `start.sh` для выбранной лабораторной.

Для лабораторной `02-01-first-script` команда будет:

```
/labs/02-01-first-script/start.sh
```