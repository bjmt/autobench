PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGVER  := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGSRC  := $(shell basename `pwd`)

all: prep build check clean

prep:
	R -q -e "Rcpp::compileAttributes(); devtools::document()"

build:
	cd ..;\
	R CMD BUILD $(PKGSRC)

check:
	cd ..;\
	R CMD CHECK $(PKGNAME)_$(PKGVER).tar.gz

install:
	cd ..;\
	R CMD INSTALL $(PKGNAME)_$(PKGVER).tar.gz

clean:
	cd ..;\
	$(RM) -r $(PKGNAME).Rcheck;\
	mv -f $(PKGNAME)_$(PKGVER).tar.gz -t $(PKGNAME)/builds

.PHONY: examples

examples:
	cd inst/script;\
	./example-markdown.R;\
	./example-text.R
