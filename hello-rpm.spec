Name:           hellorpm
Version:        1.0 
Release:        0
Summary:        Hello RPM Package, first test package.

License:        GPL
URL:            http://ericsson.com
Source0:        %{name}-%{version}-%{release}.tar.gz

BuildArch:	noarch
%description
Hello RPM first rpm package.

%prep
%setup -q
%build
%install
install -m 0755 -d $RPM_BUILD_ROOT/etc/hello-rpm
install -m 0755 hello-world.py $RPM_BUILD_ROOT/etc/hello-rpm/hello-world.py

%files
/etc/hello-rpm
/etc/hello-rpm/hello-world.py
