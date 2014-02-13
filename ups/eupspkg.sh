# EupsPkg config file. Sourced by 'eupspkg'

# Breaks on Darwin w/o this
export LANG=C
	
PKGDIR=$PWD
BUILDDIR=$PWD/../xrootd-build

config()
{
	echo "STARTING XROOTD BUILD IN $PWD"
	rm -rf ${BUILDDIR}
	mkdir ${BUILDDIR}
	cd ${BUILDDIR}
	cmake ${PKGDIR} -DCMAKE_INSTALL_PREFIX=${PREFIX} -DENABLE_PERL=FALSE
}

build()
{
	cd ${BUILDDIR}
	default_build
}

install()
{
	cd ${BUILDDIR}
	make -j$NJOBS install
	cd ${PKGDIR}
	install_ups
}
