library verilog;
use verilog.vl_types.all;
entity pratica2 is
    port(
        clock           : in     vl_logic;
        pcClock         : in     vl_logic;
        resetN          : in     vl_logic;
        run             : in     vl_logic;
        \bus\           : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        n               : in     vl_logic_vector(4 downto 0)
    );
end pratica2;
