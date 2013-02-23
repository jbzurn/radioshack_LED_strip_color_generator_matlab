function colorname_stripe_code_generator(color_name,hex_color_string1,hex_color_string2,hex_color_string3,n_lines)
%draw a hex matrix to generate arduino code for radioshack LED strip
%pattern is
%color1,color2,color3,color2,color1,color2,color3,color2,color1,color2
%JB Zurn

%10x10 strip.  Each '1' controls 3 contiguous LEDs.
%Use to convert hex color codes.  The radioshack strip has a non-standard
%color format.  Hex color code for websites is RRGGBB. the Radioshack LED
%strip is GGBBRR (move the two R units to the end). Also, the colors are
%off a bit from the hex. 

%it will output a filename, 'this_color.txt' that will contain the Arduino
%formatted color

%example code:
%green, white, orange stripes
%colorname_stripe_code_generator('irishflag_stripe','003C00','FFFFFF','FF7F00',10);


%%%%pre-set by the LED
n_addressable = 10; %number of unique addressable LED spots on strip

%%%%%%%%%%%%%%%%automated code generator%%%%%%%%%%%%%%5

%color_split
R1=hex_color_string1(1);
R2=hex_color_string1(2);
G1=hex_color_string1(3);
G2=hex_color_string1(4);
B1=hex_color_string1(5);
B2=hex_color_string1(6);
RS_hex1 = sprintf('%s%s%s%s%s%s',G1,G2,B1,B2,R1,R2);

R1=hex_color_string2(1);
R2=hex_color_string2(2);
G1=hex_color_string2(3);
G2=hex_color_string2(4);
B1=hex_color_string2(5);
B2=hex_color_string2(6);
RS_hex2 = sprintf('%s%s%s%s%s%s',G1,G2,B1,B2,R1,R2);

R1=hex_color_string3(1);
R2=hex_color_string3(2);
G1=hex_color_string3(3);
G2=hex_color_string3(4);
B1=hex_color_string3(5);
B2=hex_color_string3(6);
RS_hex3 = sprintf('%s%s%s%s%s%s',G1,G2,B1,B2,R1,R2);


starting_line = sprintf('PROGMEM const unsigned long %s[10][10]={\n',color_name);
ending_line = '};';

% % %to repeat the same color across all LEDs
% % center_colors=sprintf('0x%s',RS_hex);
% % for i=1:(n_addressable-1)
% %     center_colors = sprintf('%s,0x%s',center_colors,RS_hex);
% % end
center_colors=sprintf('0x%s,0x%s,0x%s,0x%s,0x%s,0x%s,0x%s,0x%s,0x%s,0x%s',RS_hex1,RS_hex2,RS_hex3,RS_hex2,RS_hex1,RS_hex2,RS_hex3,RS_hex2,RS_hex1,RS_hex2);

center_line1 = sprintf('  {%s},',center_colors);

center_lines = sprintf('%s\n',center_line1);
for n=1:(n_lines-1)
    center_lines = strcat(center_lines,sprintf('%s\n',center_line1));
end
%center_lines = strcat(center_lines,sprintf('\n'));
%%%%now put it all together

all_together = strcat(starting_line,sprintf('%s\n',center_lines),ending_line);

filename = sprintf('%s.txt',color_name);
fid = fopen(filename,'w');

fprintf(fid,'%s',all_together);

fclose(fid);
