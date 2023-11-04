#!/usr/bin/env bash

# kadai03b 2023年04月28日

command=ffmpeg
suffix=_opt
begin=0.5
end=2
version=v0.0.0

help="
    Convert audio file(s) by unifying the silent section length and adjusting the volume with FFmpeg.

    Usage: $0 [-c CMD] [-s SUF] [-b SEC] [-e SEC] path/to/input/file/or/dir

    -c | --command COMMAND
        command used. default: $command

    -s | --suffix SUFFIX
        suffix appended to filename. default: $suffix

    -b | --begin SECONDS
        duration of silent section prepend to head. default: $begin

    -e | --end SECONDS
        duration of silent section append to tail. default: $end

    -v
        show version
"

ARGNUM=0

# コマンドライン引数を解析する
while [[ -n "$1" ]]; do
    arg="$1"
    shift

    # ロングオプション引数なら
    if [[ "$arg" = --* ]]; then
        # オプション=値という形だったら
        if [[ "$arg" = *=* ]]; then
            opt="${arg%%=*}"
            optarg="${arg#*=}"

        # オプション 値という形だったら
        else
            opt="$arg"
            optarg="$1"

            # 次の引数が別のオプションなら
            if [[ "$optarg" = -* ]]; then
                optarg=
            else
                shift
            fi
        fi

    # ショートオプション引数なら
    elif [[ "$arg" = -* ]]; then
        # オプション 値という形だったら
        if [[ "$arg" = -? ]]; then
            opt="$arg"
            optarg="$1"

            # 次の引数が別のオプションなら
            if [[ "$optarg" = -* ]]; then
                optarg=
            else
                shift
            fi

        # オプション値という形だったら
        else
            opt="${arg:0:2}"
            optarg="${arg:2}"
        fi

    # 位置引数なら
    else
        declare ARG$ARGNUM="$arg"
        ((ARGNUM++))
        continue
    fi

    case "$opt" in
        -c|--command)
            command="$optarg"
            ;;
        -s|--suffix)
            suffix="$optarg"
            ;;
        -b|--begin)
            begin="$optarg"
            ;;
        -e|--end)
            end="$optarg"
            ;;
        -v|--version)
            echo "$0: $version"
            exit
            ;;
        -h|--help)
            echo -e "$help"
            exit
            ;;
        *)
            echo "$0: $opt: illegal option" >&2
            exit 1
            ;;
    esac
done

# 実行ファイルがなければ終了
if [ ! -f "$command" ]; then
    echo "$0: $command: not found" >&2
    # echo -e "$help"
    # exit 1
fi

# 位置引数に過不足があれば終了
if [ $ARGNUM -ne 1 ]; then
    echo "$0: input path required" >&2
    echo -e "$help"
    exit 1
fi

input_path="$ARG0"

# 入力パスがディレクトリだったら
if [ -d "$input_path" ]; then
    total=0
    for input_file_path in "$input_path"/*.*; do
        ((total++))
        declare input_file_path$total="$input_file_path"
    done
else
    total=1
    input_file_path1="$input_path"
fi

# ログファイルのディレクトリがなければ作成する
if [ ! -d "log" ]; then
    mkdir "log"
fi

# 繰り返し文字を出力する関数
repeat_str() {
    local str=$1
    local count=$2

    # 繰り返し回数が0以下の場合は何もしない
    if [[ $count -le 0 ]]; then
        printf ''
        return
    fi

    for _ in $(seq $count); do
        printf "$str"
    done
}

# 文字列の長さとターミナルの列数から文字列の行数を計算する関数
cal_rows() {
    cols1=$(echo "$1" | wc -c)
    cols2=$(echo "$1" | wc -m)
    cols=$(((cols1 + cols2) / 2))
    COLS=$(tput cols)
    echo $((cols / COLS + 1))
}

# 指定した行数の出力をクリアする関数
clear_lines() {
    local count=${1-1}
    for _ in $(seq $count); do
        printf "\033[1F\033[2K"
    done
}

count=0

for i in $(seq $total); do
    varname=input_file_path$i
    input_file_path=${!varname}

    rows=0

    # 行数を計上した上で出力する関数
    print() {
        add_rows=$(cal_rows "$1")
        rows=$((rows + add_rows))
        echo "$1"
    }

    # printによって出力された行をクリアする関数
    clear_lines_by_print() {
        clear_lines $rows
        rows=0
    }

    # プログレスバーを表示する
    progress=$((count * 100 / total))
    print "$(printf "[%-100s] %d%%" "$(repeat_str '#' $progress)" $progress)"
    ((count++))

    # ファイルじゃない場合はスキップする
    if [ ! -f "$input_file_path" ]; then
        clear_lines_by_print
        continue
    fi

    output_file_path="${input_file_path%.*}"
    ext="${input_file_path##*.}"
    output_file_path="$output_file_path$suffix.$ext"

    # 出力先にすでにファイルが存在するならスキップする
    if [ -f "$output_file_path" ]; then
        clear_lines_by_print
        echo "Skipping $input_file_path: output file already exists" >&2
        continue
    fi

    print "$input_file_path |-> $output_file_path"

    log_file_path="log/$(date '+%Y-%m-%d_%H-%M-%S').log"

    print "log: $log_file_path"

    # 音量レベルを取得する
    "$command" -i "$input_file_path" -af volumedetect -f null >> "$log_file_path" /dev/null 2>&1
    repeat_str '#' 100 >> "$log_file_path"
    echo >> "$log_file_path"
    volume=$(cat "$log_file_path" | grep "max_volume" | cut -d\  -f 5)

    print "volume level: $volume"

    #音量と先頭と末尾の無音部分を調整する
    "$command" -i "$input_file_path" -af "volume=$volume, silenceremove=start_periods=1:start_threshold=-60dB:detection=peak, silenceremove=stop_periods=-1:stop_threshold=-40dB:detection=peak, adelay=${begin}s:all=1, apad=pad_dur=${end}" >> "$log_file_path" 2>&1 "$output_file_path"
    repeat_str '#' 100 >> "$log_file_path"
    echo >> "$log_file_path"

    # 出力をクリアする
    clear_lines_by_print
done

# 実行コマンド + 実行結果
