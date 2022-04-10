module selector_and_or
#(in_size = 2,
   in_val = 4)
(input [in_size * in_val - 1 : 0] in,
 input [in_val - 1 : 0] sel,
 output [in_size - 1 : 0] out
 );
 wire [in_size * in_val - 1 : 0] mask;
 wire [in_size * in_val - 1 : 0] masked;
 wor [in_size - 1 : 0] pre_out;
 genvar i;
 genvar j;
 generate
 for (i = 0; i < in_val; i = i + 1)
 begin: gen_array
assign mask[(i + 1) * in_size - 1 : i * in_size]= {in_size{sel[i]}};
end
endgenerate
assign masked = mask & in;
generate
for (j = 0; j < in_val; j = j + 1)
begin: gen_wideor
assign pre_out = masked[(j + 1) * in_size - 1 : j * in_size];
end
endgenerate
assign out = pre_out;
endmodule
 
 