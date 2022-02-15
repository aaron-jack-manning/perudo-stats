COMPILER = ocamlopt
EXT = .cmx
AEXT = .cmxa

STANDARD_FLAGS = -nopervasives -O3
STANDARD_COMPILE = $(COMPILER) $(STANDARD_FLAGS) -c
STANDARD_COMPILE_WITH_C = $(COMPILER) -ccopt -fPIC -c
LIB_NAME = library

COMPILED_FILES = general$(EXT) fatal$(EXT) int$(EXT) float$(EXT) option$(EXT) stack$(EXT) list$(EXT) map$(EXT) queue$(EXT) set$(EXT) tree$(EXT) string$(EXT) char$(EXT) bool$(EXT) console$(EXT) file$(EXT)
C_LIBS_FOR_LINKING = -cclib -lconsole_external -cclib -lfile_external

build:
	make clean

	$(COMPILER) $(STANDARD_FLAGS) -c general.mli general.ml

	$(STANDARD_COMPILE) fatal.mli fatal.ml
	$(STANDARD_COMPILE) int.mli int.ml
	$(STANDARD_COMPILE) float.mli float.ml
	$(STANDARD_COMPILE) option.mli option.ml
	$(STANDARD_COMPILE) stack.mli stack.ml
	$(STANDARD_COMPILE) list.mli list.ml
	$(STANDARD_COMPILE) map.mli map.ml
	$(STANDARD_COMPILE) queue.mli queue.ml
	$(STANDARD_COMPILE) set.mli set.ml
	$(STANDARD_COMPILE) tree.mli tree.ml
	$(STANDARD_COMPILE) string.mli string.ml
	$(STANDARD_COMPILE) char.mli char.ml
	$(STANDARD_COMPILE) bool.mli bool.ml
	$(STANDARD_COMPILE_WITH_C) console_external.c console.mli console.ml
	ocamlmklib console_external.o -o console_external
	$(STANDARD_COMPILE_WITH_C) file_external.c file.mli file.ml
	ocamlmklib file_external.o -o file_external

	$(STANDARD_COMPILE) array.mli array.ml

	$(COMPILER) -a $(C_LIBS_FOR_LINKING) $(COMPILED_FILES) -o library.cmxa

clean:
	rm -f *.o *.a *.s *.so *.cmi *.cmx *.cmxa *.cmo *.cma
