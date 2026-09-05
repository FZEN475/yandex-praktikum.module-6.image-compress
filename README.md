# image-compress

Образ для практической работы по Yandex practicum

## Description

Написанное на **Python** приложение `image-compress`. Это HTTP-сервер для сжатия картинок; он принимает файл в POST-запросе, уменьшает в заданное количество раз и сохраняет в каталоге (по умолчанию - `/tmp`). Путь для сохранения можно поменять, указав его в переменной окружения `IMAGE_PATH`.

## Feature

С помощью переменной окружения `COMPRESS_RATIO` можно установить степень сжатия картинки. Сервер будет уменьшать её линейные размеры во столько раз, сколько указано в значении этой переменной.

## Examples
Вот пример запроса к приложению `image-compress`:
```shell

$ curl -X POST -F "image=@testdata/python-large.png" http://localhost:18080/compress
{"message":"compressed_umpesl1d.PNG"} 
```


