import pyscf
from pyscf import cc, lib, tools, scf, symm, ao2mo
from pyscf.gto.basis import parse_gaussian
from pyscf.cc.mrcc import MRCCInterface
from pyscf.scf import atom_hf, hf

name = 'out'
mol = pyscf.M(
    atom = '''
        O
    ''',
    unit = 'angstrom',
    basis = {
            'O' : parse_gaussian.load('O-aCV7Z-FELLER-U.gbs', 'O')
    },
    charge = 0,
    spin = 2,
    symmetry = True,
    verbose = 9,
    symmetry_subgroup = 'D2h',
    output = name +'.txt',
    max_memory = 755000,
)

mf = mol.UHF().set(
    conv_tol=1e-10,
    max_cycle=9999,
    ddm_tol=1e-9,
    direct_scf=False,
    chkfile='/home/jaafar1/links/projects/rrg-tzeng/jaafar1/PySCF-MRCC/Oxygen/NewChapter-Neutral/AE/aCV7Z-FELLER-U/X2C/UHF/chkfiles/out.chk',
    init_guess='chk',
    irrep_nelec={'Ag': 4, 'B3u': 2, 'B2u': 1, 'B1u': 1}
).sfx2c1e()

mf.kernel()

#pyscf.tools.fcidump.from_chkfile_uhf('fort.55',name+'.chk',tol=1e-18, float_format='% 0.20E',molpro_orbsym=False,orbsym=None)
pyscf.tools.fcidump.from_scf_uhf(mf,'fort.55',tol=1e-18, float_format='% 0.20E',molpro_orbsym=False)
