module hello;
  initial begin
    $display("Hello from FuseSoC venv!");
    #10;
    $finish;
  end
endmodule
