function colorname_code_generator(colorname,hex_color_string,n_lines)
%draw a hex matrix to generate arduino code for radioshack LED strip
%JB Zurn

%10x10 strip.  Each '1' controls 3 contiguous LEDs.
%Use to convert hex color codes.  The radioshack strip has a non-standard
%color format.  Hex color code for websites is RRGGBB. the Radioshack LED
%strip is GGBBRR (move the two R units to the end). Also, the colors are
%off a bit from the hex. 

%it will output a filename, 'this_color.txt' that will contain the Arduino
%formatted color

%example code:
%colorname = 'this_color';
%hex_color_string = '009B48';
%n_lines = 10; %number of color lines to print out
%colorname_code_generator(colorname,hex_color_string,n_lines)

%%%%pre-set by the LED
n_addressable = 10; %number of unique addressable LED spots on strip

%%%%%%%%%%%%%%%%automated code generator%%%%%%%%%%%%%%5

%color_split
R1=hex_color_string(1);
R2=hex_color_string(2);
G1=hex_color_string(3);
G2=hex_color_string(4);
B1=hex_color_string(5);
B2=hex_color_string(6);


RS_hex = sprintf('%s%s%s%s%s%s',G1,G2,B1,B2,R1,R2);

starting_line = sprintf('PROGMEM const unsigned long %s[10][10]={\n',colorname);
ending_line = '};';

%to repeat the same color across all LEDs
center_colors=sprintf('0x%s',RS_hex);
for i=1:(n_addressable-1)
    center_colors = sprintf('%s,0x%s',center_colors,RS_hex);
end

center_line1 = sprintf('  {%s},',center_colors);

center_lines = sprintf('%s\n',center_line1);
for n=1:(n_lines-1)
    center_lines = strcat(center_lines,sprintf('%s\n',center_line1));
end

%%%%now put it all together

all_together = strcat(starting_line,center_lines,ending_line);
