# make -j for multi threaded
# match "module foobar() { // `make` me"
#TARGETS=$(shell sed '/^module [a-z0-9_-]*().*make..\?me.*$$/!d;s/module //;s/().*/.stl/' print.scad)

all: stl primitive base stoneage copperage


base: bow_mount mount_beam mount_beam_alt

primitive: prim_base

stoneage: stone_block_p stone_stick_p stone_mount_offset_p

copperage: copper_pinmount_p copper_block_p copper_stick_p copper_hinge_p

%:
	openscad -m make -o stl/$@.stl -D "$@();" print.scad

stl:
	mkdir stl
