Name:       harbour-clipboardshareplugin

# >> macros
# << macros

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}

Summary:    TransferEngine plugin for copying text and urls into clipboard
Version:    1.1
Release:    1
Group:      System/Libraries
License:    The MIT License (MIT)
URL:        https://github.com/Maledictus/clipboardshareplugin
Source0:    %{name}-%{version}.tar.bz2

Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   nemo-transferengine-qt5 >= 0.3.1
Requires:   declarative-transferengine-qt5 >= 0.0.44
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(nemotransferengine-qt5)

%description
TransferEngine plugin for copying text and urls into clipboard

%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qtc_qmake5

%qtc_make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

%files
%defattr(-,root,root,-)
%{_libdir}/nemo-transferengine/plugins/*.so
%{_datadir}/nemo-transferengine/plugins/ClipboardShareUi.qml

# >> files
# << files

