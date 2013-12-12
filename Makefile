git_builder="debuild -i -I -us -uc"
export_dir="./builds"
dest_data="./debian/iptables-hanxhx"

all:
	@echo You mean "make debian-package"?

clean:
	@rm -rf $(export_dir) DEBIAN/ iptables-hanxhx/
	@echo cleaned


deb: debian-package

debian-package:
	@echo building...
	find . -type d | grep -vF '.git' | sed -r "s#^\./?##g;" | egrep '^(var|etc)' > debian/dirs
	@git-buildpackage --git-ignore-new --git-export-dir=$(export_dir) --git-upstream-tree=master --git-dist=unstable --git-builder=$(git_builder)
