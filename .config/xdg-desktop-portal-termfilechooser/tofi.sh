#!/bin/sh

## This wrapper script is invoked by xdg-desktop-portal-termfilechooser.
##
## Inputs:
## 1. "1" if multiple files can be chosen, "0" otherwise.
## 2. "1" if a directory should be chosen, "0" otherwise.
## 3. "0" if opening files was requested, "1" if writing to a file was
##    requested. For example, when uploading files in Firefox, this will be "0".
##    When saving a web page in Firefox, this will be "1".
## 4. If writing to a file, this is recommended path provided by the caller. For
##    example, when saving a web page in Firefox, this will be the recommended
##    path Firefox provided, such as "~/Downloads/webpage_title.html".
##    Note that if the path already exists, we keep appending "_" to it until we
##    get a path that does not exist.
## 5. The output path, to which results should be written.
##
## Output:
## The script should print the selected paths to the output path (argument #5),
## one path per line.
## If nothing is printed, then the operation is assumed to have been canceled.

multi="$1"
dir="$2"
open_save="$3"
caller_path="$4"
write_path="$5"

empty_exit() {
    if [[ "$1" == "" ]]; then exit; fi
}

# Saving file
if [[ $open_save == 1 ]]; then
    caller_dir="$(dirname "$caller_path")/"
    caller_name=$(basename "$caller_path")

    use_dir=$(echo -e "yes\nno" | tofi --prompt-text='Use caller path?' --placeholder-text="$caller_path" --auto-accept-single=true)
    empty_exit "$use_dir"
    if [[ "$use_dir" == "yes" ]]; then
        path="${caller_dir}"
    else
        user_dir="$(fd -a -td --base-directory="$HOME" | sort | cat <(echo ${HOME}/) - | tofi --prompt-text='dirname' --placeholder-text="$caller_dir")"
        empty_exit "$user_dir"
        path="${user_dir}"
    fi

    use_name=$(echo -e "yes\nno" | tofi --prompt-text='Use caller name?' --placeholder-text="$caller_name" --auto-accept-single=true)
    empty_exit "$use_name"
    if [[ "$use_name" == "yes" ]]; then
        path="${path}${caller_name}"
    else
        user_name="$(true | tofi --prompt-text='name' --placeholder-text="$caller_name" --require-match=false)"
        empty_exit "$user_name"
        path="${path}${user_name}"
    fi

    echo "$path" > "$write_path"
    exit
fi

# Uploading file
if [[ $multi == 0 && $dir == 0 ]]; then
    path="$(fd -a -tf --base-directory="$HOME" | tofi --prompt-text='file')"
    empty_exit "$path"

    echo "$path" > "$write_path"
    exit
fi

# Uploading files
if [[ $multi == 1 && $dir == 0 ]]; then
    files="$(fd -a -tf --base-directory="$HOME")"
    n='
'
    while true; do
        path="$(echo "$files" | tofi --prompt-text='files')"
        [[ "$path" == "" ]] && break
        paths="${paths}${path}${n}"
    done
    empty_exit "$paths"

    echo "$paths" > "$write_path"
    exit
fi

# Uploading directory
if [[ $multi == 0 && $dir == 1 ]]; then

    path="$(fd -a -td --base-directory="$HOME" | sort | cat <(echo ${HOME}/) - | tofi --prompt-text='directory')"
    empty_exit "$path"

    echo "$path" > "$write_path"
    exit
fi
