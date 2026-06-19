import pyscf
from pyscf import cc, lib, tools, scf, symm, ao2mo
from pyscf.gto.basis import parse_gaussian
from pyscf.scf import atom_hf

name = 'out'
mol = pyscf.M(
    atom = '''
        O
    ''',
    unit = 'angstrom',
    basis = {
            'O' : parse_gaussian.load('O-d-aug-cc-pwCVTZ.gbs', 'O')
    },
    charge = 0,
    spin = 2,
    symmetry = True,
    verbose = 9,
    symmetry_subgroup = 'D2h',
    output = name +'.txt',
    max_memory = 8000,
)

original_AtomSphAverageRHF = atom_hf.AtomSphAverageRHF

class CustomAtomSphAverageRHF(original_AtomSphAverageRHF):
    def __init__(self, mol):
        super().__init__(mol)
        self.max_cycle = 9999
        self.direct_scf = False

atom_hf.AtomSphAverageRHF = CustomAtomSphAverageRHF

mf = mol.UHF().set(
    conv_tol=1e-15,
    max_cycle=9999,
    ddm_tol=1e-14,
    direct_scf=False,
    chkfile=name + '.chk',
    init_guess='atom',
    irrep_nelec={'Ag': 4, 'B3u': 2, 'B2u': 1, 'B1u': 1}
)

mf.kernel()

atom_hf.AtomSphAverageRHF = original_AtomSphAverageRHF

#pyscf.tools.fcidump.from_chkfile_uhf('FCIdump',name+'.chk',tol=1e-18, float_format='% 0.20E',molpro_orbsym=False,orbsym=None)
pyscf.tools.fcidump.from_scf_uhf(mf,'fort.55',tol=1e-18, float_format='% 0.20E',molpro_orbsym=False)
#MRCCInterface.run_mrcc(mf, fort_file='fort.55', mrcc_input_file='MINP', tol=1e-18, float_format='% 0.20E', molpro_orbsym=False)
