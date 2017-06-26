![dotvim](images/logo.png)



## Installation

**curl**
```bash
curl -o - https://raw.githubusercontent.com/filipelinhares/dotvim/master/install.sh | sh
```
> Don't worry, it will back up your existing vim configuration.

## Keymaps

| Command              | Action                                   |
| -------------------- | ---------------------------------------- |
| <kbd>leader+f</kbd>  | VimFiler                                 |
| <kbd>ctrl+p</kbd>    | Fuzzy Search                             |
| <kbd>leader+a</kbd>  | Ag Search                                |
| <kbd>leader+2-</kbd> | Convert string under cursor to dash-case |
| <kbd>leader+2u</kbd> | Convert string under cursor to SNAKE_UPPERCASE |
| <kbd>leader+2_</kbd> | Convert string under cursor to snake_case |
| <kbd>leader+2c</kbd> | Convert string under cursor to camelCase |
| <kbd>leader+2m</kbd> | Convert string under cursor to MixedCaseg |

- **Firefox like tab navigation supported**
- and [more](./.vimrc)...

## Colors

![Screenshots](images/screenshot.png)

``` viml
set background=dark
let g:airline_theme='wombat'
colorscheme wombat
```

```viml
set background=[dark | light]
let g:airline_theme='one'
colorscheme one
```

## Fork and customize

1. :cyclone: Clone the repository
2. :pencil: Change the [folder name](https://github.com/filipelinhares/dotvim/blob/master/install.sh#L14)
3. :pencil: Change the [git endpoint](https://github.com/filipelinhares/dotvim/blob/master/install.sh#L18) to your repository
4. :smile: Have fun with your new `vimrc`

## License
[MIT](LICENSE.md) © Filipe Linhares
