transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC\ II/Pratica\ II/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC II/Pratica II/Pratica-II-LAOC-II/Pratica 2/proc.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC\ II/Pratica\ II/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC II/Pratica II/Pratica-II-LAOC-II/Pratica 2/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC\ II/Pratica\ II/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC II/Pratica II/Pratica-II-LAOC-II/Pratica 2/dec3to8.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC\ II/Pratica\ II/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC II/Pratica II/Pratica-II-LAOC-II/Pratica 2/regn.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC\ II/Pratica\ II/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC II/Pratica II/Pratica-II-LAOC-II/Pratica 2/ULA.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC\ II/Pratica\ II/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/erick/OneDrive/Documentos/GitHub/Repositorios/LAOC II/Pratica II/Pratica-II-LAOC-II/Pratica 2/MUX.v}

