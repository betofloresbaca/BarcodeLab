event_inherited();

code_table = [
    [[0,0,0,1,1,0,1], [1,1,1,0,0,1,0]],
    [[0,0,1,1,0,0,1], [1,1,0,0,1,1,0]],
    [[0,0,1,0,0,1,1], [1,1,0,1,1,0,0]],
    [[0,1,1,1,1,0,1], [1,0,0,0,0,1,0]],
    [[0,1,0,0,0,1,1], [1,0,1,1,1,0,1]],
    [[0,1,1,0,0,0,1], [1,0,0,1,1,1,0]],
    [[0,1,0,1,1,1,1], [1,0,1,0,0,0,0]],
    [[0,1,1,1,0,1,1], [1,0,0,0,1,0,0]],
    [[0,1,1,0,1,1,1], [1,0,0,1,0,1,0]],
    [[0,0,0,1,0,1,1], [1,1,1,0,1,0,0]],
];


number = "";

function set_number(number_str) {
    if(string_length(number_str) == 11){
        var control_digit = calc_control_digit(number_str);
        number = string_concat(number_str, string(control_digit));
    } else if(string_length(number_str) == 12){
        var number_split = string_split_at(number_str, 11);
        var control_digit = calc_control_digit(number_split[0]);
        if(control_digit != int64(number_split[1])){
            return false;
        }
        number = number_str;
    } else {
        return false;
    }
    encode(number);
    return true;
}

function calc_control_digit(number_str){
    var sum = 0;
    for(var i=0; i<string_length(number_str); i++){
        var digit = int64(string_char_at(number_str, i+1));
        sum += digit * (i%2? 3: 1);
    }
    return 10 - sum%10;
}

function encode(number_str){
    bits = [1,0,1];
    for(var i=0; i<string_length(number_str); i++){
        var digit = int64(string_char_at(number_str, i+1));
        if(i==6){
            bits = array_concat(bits, [0,1,0,1,0]);
        }
        bits = array_concat(bits, code_table[digit][i < 6? 0 : 1]);
    }
    bits = array_concat(bits, [1,0,1]);
}

set_number("01234567890");