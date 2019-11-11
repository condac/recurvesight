# make -j for multi threaded
# match "module foobar() { // `make` me"
#TARGETS=$(shell sed '/^module [a-z0-9_-]*().*make..\?me.*$$/!d;s/module //;s/().*/.stl/' print.scad)

all: stl primitive base


base: bow_mount mount_beam

primitive: prim_base

%:
	openscad -m make -o stl/$@.stl -D "$@();" print.scad

stl:
	mkdir stl
