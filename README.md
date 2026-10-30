# log-analyzer-25

Практическая №18, вариант 25. Bash-анализатор считает строки, строки с error/failed и строки с warn без учёта регистра.

```bash
bash analyze.sh /path/to/log.txt
bash test.sh
```

Три проверки: смешанный журнал, пустой журнал, отклонение отсутствующего файла.

Workflow запускает эти тесты для основной ветки и pull request. Проверка PR — единственное выбранное дополнение. Удалённый результат подтверждается настоящими запусками Actions, а не наличием этого файла.

Краткая справка до переноса документации находится в usage.txt.

Учебная симуляция двух ролей A/B одним участником. Используются две локальные копии и один реальный аккаунт Godzilla214321. Комментарии ролей не являются независимым одобрением второго человека.

## Справка по вводу и выводу

```text
Usage: bash analyze.sh LOG_FILE
Output: lines=N errors_or_failed=N warnings=N
Only readable regular files are accepted.
```

Требуется один доступный для чтения обычный файл.

## Уточнение ввода (роль B)

```text
Usage: bash analyze.sh LOG_FILE
Output: lines=N errors_or_failed=N warnings=N
Only readable regular files are accepted.
Exit 2 means an invalid, missing or unreadable input file.
Error/failed and warn matching is case-insensitive.
```

Конфликт удаления/редактирования usage.txt разрешён переносом полезного текста в README.
