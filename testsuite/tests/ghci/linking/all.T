test('ghcilink001',
     [when(ghc_dynamic(), expect_fail), # dynamic ghci can't load '.a's
      unless(doing_ghci, skip),
      extra_clean(['dir001/*','dir001'])],
     run_command,
     ['$MAKE -s --no-print-directory ghcilink001'])

test('ghcilink002', [unless(doing_ghci, skip)], run_command,
     ['$MAKE -s --no-print-directory ghcilink002'])

test('ghcilink003', [unless(doing_ghci, skip)], run_command,
     ['$MAKE -s --no-print-directory ghcilink003'])

test('ghcilink004',
     [unless(doing_ghci, skip),
      when(arch('powerpc64') or arch('powerpc64le'), expect_broken(11259))],
     run_command, ['$MAKE -s --no-print-directory ghcilink004'])

test('ghcilink005', [unless(doing_ghci, skip)], run_command,
     ['$MAKE -s --no-print-directory ghcilink005'])

test('ghcilink006', [unless(doing_ghci, skip)], run_command,
     ['$MAKE -s --no-print-directory ghcilink006'])

test('T3333',
     [unless(doing_ghci, skip),
      unless(opsys('linux') or opsys('darwin') or ghc_dynamic(),
             expect_broken(3333))],
     run_command, ['$MAKE -s --no-print-directory T3333'])
