#!/bin/bash

set -eu

USAGE="create-sublime-project.sh <directory> [dest]

Creates a sublime-project and sublime-workspace file in current directory or in <dest>
"

if [ -z "$1" ]; then
    echo $USAGE
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1 is not a directory"
    exit 1
fi

DEST=${2:-.}

if [ ! -d "$DEST" ]; then
    echo "$DEST is not a directory"
    exit 1
fi

ABSPATH=$(python -c "import os.path; print os.path.abspath('$1')")
NAME=$(python -c "import os.path; print os.path.basename(os.path.abspath('$1'))")

PROJECTFILE=$(python -c "import os.path; print os.path.abspath(os.path.join('$DEST', '${NAME}.sublime-project'))")
WORKSPACEFILE=$(python -c "import os.path; print os.path.abspath(os.path.join('$DEST', '${NAME}.sublime-workspace'))")

cat <<EOF > "${PROJECTFILE}"
{
    "folders":
    [
        {
            "path": "${ABSPATH}"
        }
    ]
}
EOF

cat <<EOF > "${WORKSPACEFILE}"
{
	"auto_complete":
	{
		"selected_items": [],
	},
	"buffers":
	[
	],
	"build_system": "",
	"build_system_choices": [],
	"build_varint": "",
	"command_palette":
	{
		"height": 93.0,
		"last_filter": "",
		"selected_items": [],
		"width": 435.0
	},
	"console":
	{
		"height": 409.0,
		"history": [],
	},
	"distraction_free":
	{
		"menu_visible": true,
		"show_minimap": false,
		"show_open_files": false,
		"show_tabs": false,
		"side_bar_visible": false,
		"status_bar_visible": false
	},
	"expanded_folders":
	[
	],
	"file_history": [],
	"find":
	{
		"height": 26.0
	},
	"find_in_files":
	{
		"height": 107.0,
		"where_history":
		[
		]
	},
	"find_state":
	{
		"case_sensitive": false,
		"find_history":
		[
		],
		"highlight": true,
		"in_selection": false,
		"preserve_case": false,
		"regex": false,
		"replace_history":
		[
		],
		"reverse": false,
		"show_context": true,
		"use_buffer2": true,
		"whole_word": false,
		"wrap": true
	},
	"groups":
	[
		{
			"sheets":
			[
			]
		}
	],
	"incremental_find":
	{
		"height": 26.0
	},
	"input":
	{
		"height": 36.0
	},
	"layout":
	{
		"cells":
		[
			[
				0,
				0,
				1,
				1
			]
		],
		"cols":
		[
			0.0,
			1.0
		],
		"rows":
		[
			0.0,
			1.0
		]
	},
	"menu_visible": true,
	"pinned_build_system": "",
	"project": "${NAME}.sublime-project",
	"replace":
	{
		"height": 48.0
	},
	"save_all_on_build": true,
	"select_file":
	{
		"height": 0.0,
		"last_filter": "",
		"selected_items": [],
		"width": 0.0
	},
	"select_project":
	{
		"height": 500.0,
		"last_filter": "",
		"selected_items": [],
		"width": 380.0
	},
	"select_symbol":
	{
		"height": 71.0,
		"last_filter": "",
		"selected_items": [],
		"width": 1180.0
	},
	"selected_group": 0,
	"settings":
	{
	},
	"show_minimap": false,
	"show_open_files": true,
	"show_tabs": true,
	"side_bar_visible": true,
	"side_bar_width": 215.0,
	"status_bar_visible": true,
	"template_settings":
	{
	}
}
EOF
