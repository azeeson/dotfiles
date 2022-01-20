#!/usr/bin/env bash

function ini_val() {
  local file="${1:-}"
  local sectionkey="${2:-}"
  local val="${3:-}"
  local comment="${4:-}"
  local delim=" = "
  local comment_delim=";"
  local section=""
  local key=""
  local current=""
  # add default section
  local section_default="default"

  if [[ ! -f "${file}" ]]; then
    # touch file if not exists
    touch "${file}"
  fi

  # Split on . for section. However, section is optional
  IFS='.' read -r section key <<< "${sectionkey}"
  if [[ ! "${key}" ]]; then
    key="${section}"
    # default section if not given
    section="${section_default}"
  fi

  # get current value (if exists)
  current=$(sed -En "/^\[/{h;d;};G;s/^${key}([[:blank:]]*)${delim}(.*)\n\[${section}\]$/\2/p" "${file}"|awk '{$1=$1};1')
  # get current comment (if exists)
  current_comment=$(sed -En "/^\[${section}\]/,/^\[.*\]/ s|^(${comment_delim}\[${key}\])(.*)|\2|p" "${file}"|awk '{$1=$1};1')

  if ! grep -q "\[${section}\]" "${file}"; then
    # create section if not exists (empty line to seperate new section for better readability)
    echo  >> "${file}"
    echo "[${section}]" >> "${file}"
  fi

  if [[ ! "${val}" ]]; then
    # get a value
    echo "${current}"
  else
    # set a value
    if [[ ! "${section}" ]]; then
      # if no section is given, propagate the default section
      section=${section_default}
    fi

    if [[ ! "${comment}" ]]; then
      # if no comment given, keep old comment
      comment="${current_comment}"
    fi
    # maintenance area
    # a) remove comment if new given / respect section
    sed -i.bak "/^\[${section}\]/,/^\[.*\]/ s|^\(${comment_delim}\[${key}\] \).*$||" "${file}"
    # b) remove old key / respect section
    sed -i.bak "/^\[${section}\]/,/^\[.*\]/ s|^\(${key}${delim}\).*$||" "${file}"
    # c) remove all empty lines in ini file
    sed -i.bak '/^[[:space:]]*$/d' "${file}"
    # d) insert line break before every section for better readability
    sed -i.bak $'s/^\\[/\\\n\\[/g' "${file}"
    sed -i.bak '1d' "${file}"

    # add to section
    if [[ ! "${comment}" ]]; then
      # add new key/value _without_ comment
      RET="/\\[${section}\\]/a\\
${key}${delim}${val}"
    else
      # add new key/value _with_ preceeding comment
      RET="/\\[${section}\\]/a\\
${comment_delim}[${key}] ${comment}\\
${key}${delim}${val}"
    fi
    sed -i.bak -e "${RET}" "${file}"
    # this .bak dance is done for BSD/GNU portability: http://stackoverflow.com/a/22084103/151666
    rm -f "${file}.bak"
  fi
}


function add_blacklist_directory() {
    local file="${1:-}"
    local directory="\"${2:-}\""

    [[ -f "${file}" ]] && {
        [[ ! -f "${file}.orig" ]] && {
            cp "${file}" "${file}.orig"
        }

        local current=$(ini_val $file Directory.black_name)

        [[ "$current" == *"$directory"* ]] && {
            echo "$directory is already in file: $file"
        } || {
            update=$([ -z "${current}" ] && echo "$directory" || echo "$current, $directory")
            ini_val $file Directory.black_name "$update"
            echo "$directory added in file: $file"
        }
    }
}

synology_conf_dir="$HOME/.SynologyDrive/SynologyDrive.app/Contents/Resources/conf"

add_blacklist_directory "$synology_conf_dir/blacklist.filter" "node_modules"
add_blacklist_directory "$synology_conf_dir/filter" "node_modules"
add_blacklist_directory "$synology_conf_dir/filter-v4150" "node_modules"
