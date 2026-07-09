function string_split_at(_text, _idx) {
    return [
        string_copy(_text, 1, _idx),
        string_delete(_text, 1, _idx)
    ];
}
