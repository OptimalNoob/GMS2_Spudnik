///@func insert_line_break(string,width,break,split)
//
//  Returns a given string, word wrapped to a pixel width,
//  with line break characters inserted between words.
//  Uses the currently defined font to determine text width.
//
//      string      text to word wrap, string
//      width       maximum pixel width before a line break, real
//      break       line break characters to insert into text, string
//      split       split words that are longer than the maximum, bool
//
function insert_line_break(str, wid, brk, spl) {
	var pos_space, pos_current, text_current, text_output;
	pos_space = -1;
	pos_current = 1;
	text_current = str;
	if (is_real(brk)) brk = "#";
	text_output = "";
	while (string_length(text_current) >= pos_current) {
		if (string_width(string_copy(text_current,1,pos_current)) > wid) {
			//if there is a space in this line then we can break there
			if (pos_space != -1) {
				text_output += string_copy(text_current,1,pos_space) + string(brk);
				//remove the text we just looked at from the current text string
				text_current = string_copy(text_current,pos_space+1,string_length(text_current)-(pos_space));
				pos_current = 1;
				pos_space = -1;
			} else if (spl) {
				//if not, we can force line breaks
				text_output += string_copy(text_current,1,pos_current-1) + string(brk);
				//remove the text we just looked at from the current text string
				text_current = string_copy(text_current,pos_current,string_length(text_current)-(pos_current-1));
				pos_current = 1;
				pos_space = -1;
			}
		}
		pos_current += 1;
		if (string_char_at(text_current,pos_current) == " ") pos_space = pos_current;
	}
	(string_length(text_current) > 0) text_output += text_current;
	return text_output;
}