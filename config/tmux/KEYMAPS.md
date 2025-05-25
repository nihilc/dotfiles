# Tmux config

## Bindings

Prefix: `<C-z>`

### Basic

|   Bind    | Unbind  | Description               |
| :-------: | :-----: | :------------------------ |
|  `<C-z>`  | `<C-b>` | Send the prefix key       |
| `<C-M-R>` |         | Reload config             |
|    `:`    |         | Command prompt            |
|    `?`    |         | List default key bindings |
|  `<M-b>`  |         | Toggle status             |

### Panes

#### Pane movement / swap / rotate

|   Bind    |  Unbind   | Description            |
| :-------: | :-------: | ---------------------- |
|    `k`    |  `<Up>`   | Move Up                |
|    `j`    | `<Down>`  | Move Down              |
|    `h`    | `<Left>`  | Move Left              |
|    `l`    | `<Right>` | Move Right             |
|  `<C-k>`  |    `;`    | Prev pane              |
|  `<C-j>`  |    `o`    | Next pane              |
|  `<C-h>`  |    `{`    | Swap with prev pane    |
|  `<C-l>`  |    `}`    | Swap with next pane    |
| `<C-M-h>` |  `<C-o>`  | Rotate panes backwards |
| `<C-M-l>` |  `<M-o>`  | Rotate panes forwards  |

#### Pane resize

|   Bind    |   Unbind    | Description           |
| :-------: | :---------: | --------------------- |
|  `<M-k>`  |  `<C-Up>`   | Resize +1 cell up     |
|  `<M-j>`  | `<C-Down>`  | Resize +1 cell down   |
|  `<M-h>`  | `<C-Left>`  | Resize +1 cell left   |
|  `<M-l>`  | `<C-Right>` | Resize +1 cell right  |
| `<M-S-k>` |  `<M-Up>`   | Resize +5 cells up    |
| `<M-S-j>` | `<M-Down>`  | Resize +5 cells down  |
| `<M-S-h>` | `<M-Left>`  | Resize +5 cells left  |
| `<M-S-l>` | `<M-Right>` | Resize +5 cells right |

#### Pane layout

|    Bind     | Unbind | Description             |
| :---------: | :----: | :---------------------- |
|   `<M-1>`   |        | Layout: even-horizontal |
|   `<M-2>`   |        | Layout: even-vertical   |
|   `<M-3>`   |        | Layout: main-horizontal |
|   `<M-4>`   |        | Layout: main-vertical   |
|   `<M-5>`   |        | Layout: tiled           |
|  `<Space>`  |        | Next layout             |
| `<C-Space>` |        | Prev layout             |
| `<M-Space>` |  `E`   | Spread panes evenly     |

#### Pane management

| Bind | Unbind | Description              |
| :--: | :----: | ------------------------ |
| `z`  |        | Zoom pane                |
| `!`  |        | Break pane in new window |
| `s`  |  `"`   | Split horizontal         |
| `v`  |  `%`   | Split vertical           |
| `x`  |  `x`   | Kill pane                |

### Windows

#### Window select / move

|  Bind   | Unbind  | Description            |
| :-----: | :-----: | :--------------------- |
| `[0-9]` |         | Select windows 0-9     |
|   `'`   |   `w`   | Choose window          |
|   `\`   |   `l`   | Last window            |
|   `[`   |   `p`   | Prev window            |
|   `]`   |   `n`   | Next window            |
| `<C-[>` | `<M-p>` | Prev window with alert |
| `<C-]>` | `<M-n>` | Next window with alert |
|   `{`   |         | Swap with prev window  |
|   `}`   |         | Swap with next window  |

#### Window management

|  Bind   | Unbind | Description                |
| :-----: | :----: | :------------------------- |
|   `r`   |  `,`   | Rename window              |
|   `c`   |        | New window                 |
| `<C-c>` |        | New window in current path |
|   `X`   |  `&`   | Kill window                |

### Sessions

#### Session select

|  Bind   | Unbind | Description    |
| :-----: | :----: | :------------- |
| `<M-'>` |  `s`   | Choose session |
| `<M-\>` |  `L`   | Last session   |
| `<M-[>` |  `(`   | Prev session   |
| `<M-]>` |  `)`   | Next session   |

#### Session management

|  Bind   | Unbind  | Description    |
| :-----: | :-----: | :------------- |
| `<M-r>` |   `$`   | Rename session |
| `<M-c>` |         | New session    |
| `<M-x>` |         | Kill session   |
| `<M-d>` | `<C-d>` | Detach client  |
| `<M-z>` | `<C-z>` | Suspend client |

### Buffers

|  Bind   | Unbind | Description       |
| :-----: | :----: | :---------------- |
| `<C-v>` |  `[`   | Enter copy mode   |
|   `p`   |  `]`   | Paste last buffer |
|   `-`   |  `#`   | List buffers      |
|   `=`   |        | Choose buffer     |

### Removed bindings

|  Unbind   | Description                                       |
| :-------: | :------------------------------------------------ |
| `Page Up` | Enter copy mode and scroll one page up            |
|    `r`    | Force redraw of the attached client               |
|    `i`    | Display some information about the current window |
|    `t`    | Show the time                                     |
|    `m`    | Mark the current pane (see select-pane -m)        |
|    `M`    | Clear the marked pane                             |
|    `f`    | Prompt to search for text in open windows         |
|    `D`    | Choose a client to detach                         |
|    `q`    | Briefly display pane indexes                      |
|    `'`    | Prompt for a window index to select               |
|    `.`    | Prompt for an index to move the current window    |
|    `~`    | Show previous messages from tmux, if any          |
|    `-`    | Delete the most recently copied buffer of text    |
