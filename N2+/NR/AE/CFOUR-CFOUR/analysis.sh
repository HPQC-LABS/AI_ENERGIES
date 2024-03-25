#!/bin/bash

for ccsd_t_file in *_CCSDpT.txt
do
	rohf_energy=$(grep "E(ROHF)=" $ccsd_t_file | awk '{print $2}')
	ccsd_energy=$(grep "E(CCSD)" $ccsd_t_file | awk '{print $3}')
	ccsd_t_energy=$(grep "E(CCSD(T))" $ccsd_t_file | awk '{print $3}')
	echo "$ccsd_t_file $rohf_energy $ccsd_energy $ccsd_t_energy"
done

for ccsdt_file in *_CCSDT.txt
do
	rohf_energy=$(grep "E(ROHF)=" $ccsdt_file | awk '{print $2}')
	ccsdt_energy=$(grep "total energy" $ccsdt_file | awk '{print $5}')
	echo "$ccsdt_file $rohf_energy $ccsdt_energy"
done
