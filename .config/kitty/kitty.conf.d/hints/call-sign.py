import re

regex = r'[A-Z]+[0-9]+[A-Z]+'

def mark(text, args, Mark, extra_cli_args, *a):
    for idx, m in enumerate(re.finditer(regex, text)):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '')
        yield Mark(idx, start, end, mark_text, {})

def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    matches, groupdicts = [], []
    for m, g in zip(data['match'], data['groupdicts']):
        if m:
            matches.append(m), groupdicts.append(g)
    for word, match_data in zip(matches, groupdicts):
        boss.open_url(f'https://qrz.com/db/{word.strip()}')
