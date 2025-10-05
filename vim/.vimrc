" ===========================
"   Базовая конфигурация Vim
" ===========================

" --- Общие настройки ---
set nocompatible            " Отключить совместимость с vi
set encoding=utf-8          " Кодировка UTF-8
set fileencoding=utf-8
set backspace=indent,eol,start " Разрешить удаление за пределами строки
set mouse=a                 " Разрешить использование мыши
set clipboard=unnamedplus   " Общий буфер обмена с системой
set hidden                  " Разрешить сворачивание буфера без сохранения

" --- Интерфейс ---
syntax on                   " Подсветка синтаксиса
set number                  " Номера строк
set showcmd                 " Показывать неполные команды
set showmatch               " Подсветка парных скобок
set laststatus=2            " Всегда показывать статус-строку
set wildmenu                " Умное автодополнение команд
set title                   " Показывать имя файла в заголовке окна
set scrolloff=5             " Минимум 5 строк от курсора до края

" --- Цвета и оформление ---
set background=dark
colorscheme default
highlight CursorLine cterm=NONE ctermbg=236

" --- Отступы ---
set tabstop=4               " Размер таба — 4 пробела
set shiftwidth=4            " Сдвиг при autoindent — 4 пробела
set expandtab               " Преобразовывать табы в пробелы
set autoindent              " Автоотступ при новой строке
set smartindent             " Умные отступы
set smarttab                " Корректное поведение таба

" --- Поиск ---
set ignorecase              " Игнорировать регистр
set smartcase               " Но учитывать, если есть заглавные буквы
set incsearch               " Подсветка во время ввода
set hlsearch                " Подсветка всех найденных совпадений

" --- Навигация ---
nnoremap <Space> :noh<CR>   " Пробел очищает подсветку поиска
nnoremap <C-h> <C-w>h       " Перемещение между окнами
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Быстрое сохранение и выход ---
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" --- Быстрое редактирование и перезагрузка vimrc ---
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" --- Улучшенный буферный режим ---
set splitbelow
set splitright
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" --- Улучшенная навигация по файлу ---
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" --- Визуальный режим ---
vnoremap < <gv
vnoremap > >gv

" --- Автосохранение при выходе ---
autocmd BufLeave,FocusLost * silent! wall

" --- Файлы резервных копий ---
set nobackup
set nowritebackup
set noswapfile

