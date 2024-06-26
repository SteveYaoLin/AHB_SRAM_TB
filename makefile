.PHONY:vcs sim verdi clean

VCS = vcs -f filelist.f \
	-timescale=1ns/1ns \
	-full64 \
	-R \
	-debug_acc+all \
	+define+FSDB \
	-fsdb \
	-lca -kdb \
	-fsdb tb_ahb.fsdb \
	-sverilog \
	-ntb_opts uvm-1.1 \
	-top ahb_ahb_sram_tb \
	-sverilog \
	+v2k

vcs:
	${VCS} -l com.log

sim:
	./simv -gui

verdi:
	verdi -ssf tb.fsdb &

clean:
	rm -rf csrc verdiLog simv.daidir \
	novas.* \
	vc_hdrs.h \
	simv \
	*.key \
	*.fsdb \
	*.log	\
	inter.vpd	\
	DVEfiles
