.EXPORT_ALL_VARIABLES:
tarname:=`head -1 hello-rpm.spec | awk '{print $$2}'`-`head -2 hello-rpm.spec | tail -1 | awk '{print $$2}'`-`head -3 hello-rpm.spec | tail -1 | awk '{print $$2}'`

tar:
	mv src ${tarname}
	tar -czf ${tarname}.tar.gz ${tarname}/
	mv ${tarname} src;

rpm: tar
	mkdir -p rpm-build
	mv *.tar.gz rpm-build/
	rpmbuild --define "_topdir %(pwd)/rpm-build" --define "_builddir %{_topdir}" --define "_rpmdir %{_topdir}" --define "_srcrpmdir %{_topdir}" --define '_rpmfilename %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm' --define "_specdir %{_topdir}" --define "_sourcedir  %{_topdir}" --define "vendor Ericsson" -bb hello-rpm.spec