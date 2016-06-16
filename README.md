![dotvim](images/logo.png)
> A vimrc focused to front-end development

## Installation
**curl**
```bash
curl -o - https://raw.githubusercontent.com/filipelinhares/dotvim/master/install.sh | sh
```
> Don't worry, it will back up your existing vim configuration.

## Keymaps
| Command | Action |
|--------|--------|
|<kbd>leader+f</kbd>|VimFiler|
|<kbd>ctrl+p</kbd>|Fuzzy Search|
|<kbd>leader+gst</kbd>|GitStatus|
|<kbd>leader+glog</kbd>|GitLog|
|<kbd>leader+gd</kbd>|GitDiff|
|<kbd>leader+a</kbd>|Ag Search|
|<kbd>g+f</kbd>|Go to file|

### Convertion
| Command | Action |
|--------|--------|
|<kbd>leader+2s</kbd>|Convert symbol under cursor from symbol to string|
|<kbd>leader+2y</kbd>|Convert string under cursor from string to symbol|
|<kbd>leader+2_</kbd>|Convert string under cursor to snake_case|
|<kbd>leader+2c</kbd>|Convert string under cursor to camelCase|
|<kbd>leader+2m</kbd>|Convert string under cursor to MixedCaseg|
|<kbd>leader+2u</kbd>|Convert string under cursor to SNAKE_UPPERCASE|
|<kbd>leader+2-</kbd>|Convert string under cursor to dash-case|
|<kbd>alt+a-</kbd>|Increment number by 1|
|<kbd>alt+i-</kbd>|Decrement number by 1|

### Common keys
| Command | Action |
|--------|--------|
| <kbd>ctrl+s</kbd> | Save |
| <kbd>ctrl+c</kbd> | Copy |
| <kbd>ctrl+v</kbd> | Paste |

- **Firefox like tab navigation supported**
- and [more](./.vimrc)...

## Theme
- [Hack](http://sourcefoundry.org/hack/)
- [Colorschemes](https://github.com/flazz/vim-colorschemes/tree/master/colors)

## Fork and customize

1. :cyclone: Clone the repository
2. :pencil: Change the [folder name](https://github.com/filipelinhares/dotvim/blob/master/install.sh#L14)
3. :pencil: Change the [git endpoint](https://github.com/filipelinhares/dotvim/blob/master/install.sh#L18) to your repository
4. :smile: Have fun with your new `vimrc`

## License
[MIT](LICENSE.md) © Filipe Linhares
