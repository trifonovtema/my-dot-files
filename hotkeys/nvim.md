
==========================
 Горячие клавиши и команды Neovim
==========================

Режимы:
-------
- **Normal mode**        : `Esc`
- **Insert mode**        : `i`
- **Visual mode**        : `v`
- **Command mode**       : `:`
- **Replace mode**       : `R`

Перемещение курсора:
--------------------
- **Начало строки**      : `0`
- **Конец строки**       : `$`
- **Начало файла**       : `gg`
- **Конец файла**        : `G`
- **Следующее слово**    : `w`
- **Предыдущее слово**   : `b`
- **Следующий абзац**    : `}`
- **Предыдущий абзац**   : `{`
- **Следующее предложение**: `)`
- **Предыдущее предложение**: `(`

Вставка текста:
---------------
- **Перед курсором**     : `i`
- **После курсора**      : `a`
- **Начало строки**      : `I`
- **Конец строки**       : `A`
- **Новая строка ниже**  : `o`
- **Новая строка выше**  : `O`

Удаление текста:
----------------
- **Символ под курсором**: `x`
- **До конца строки**    : `D`
- **Вся строка**         : `dd`
- **Слово**              : `dw`
- **До начала слова**    : `db`
- **До конца предложения**: `d)`

Копирование и вставка:
----------------------
- **Копировать строку**  : `yy`
- **Копировать слово**   : `yw`
- **Копировать до конца строки**: `y$`
- **Вставить после курсора**: `p`
- **Вставить перед курсором**: `P`

Отмена и повтор:
----------------
- **Отмена**             : `u`
- **Повтор**             : `Ctrl+r`

Визуальный режим:
-----------------
- **Начать визуальный режим**: `v`
- **Строчный визуальный режим**: `V`
- **Блочный визуальный режим**: `Ctrl+v`
- **Копировать выделенное**  : `y`
- **Удалить выделенное**     : `d`
- **Заменить выделенное**    : `r`

Поиск и замена:
---------------
- **Поиск вперед**       : `/`
- **Поиск назад**        : `?`
- **Следующее совпадение**: `n`
- **Предыдущее совпадение**: `N`
- **Замена в строке**    : `:s/old/new/g`
- **Замена в файле**     : `:%s/old/new/g`

Операции с файлами:
-------------------
- **Открыть файл**       : `:e <filename>`
- **Сохранить файл**     : `:w`
- **Сохранить и выйти**  : `:wq`
- **Выйти без сохранения**: `:q!`
- **Сохранить как**      : `:w <filename>`

Буферы и окна:
--------------
- **Следующий буфер**    : `:bnext`
- **Предыдущий буфер**   : `:bprev`
- **Закрыть буфер**      : `:bd`
- **Горизонтальное разделение**: `:split` или `:sp`
- **Вертикальное разделение**: `:vsplit` или `:vsp`
- **Переключение окна**  : `Ctrl+w` + `h`/`j`/`k`/`l` (влево/вниз/вверх/вправо)
- **Закрыть окно**       : `:close`

Редактирование текста:
----------------------
- **Изменить до конца слова**: `ce`
- **Изменить до конца строки**: `C`
- **Заменить символ**        : `r`
- **Изменить внутри скобок** : `ci(` или `ci)`

Прочее:
-------
- **Показать время**      : `:!date`
- **Выполнить команду shell**: `:!<command>`
- **Перезагрузить конфигурацию**: `:source ~/.config/nvim/init.vim`

======================================
