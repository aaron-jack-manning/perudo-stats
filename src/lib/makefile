STANDARD_FLAGS = -O3
STANDARD_COMPILE = ocamlopt $(STANDARD_FLAGS) -nopervasives -c
LIB_NAME = library

build:
	make clean

	ocamlopt $(STANDARD_FLAGS) -nopervasives -c general.mli general.ml

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
	$(STANDARD_COMPILE) terminal.mli terminal.ml
	$(STANDARD_COMPILE) file.mli file.ml
	$(STANDARD_COMPILE) array.mli array.ml
	$(STANDARD_COMPILE) random.mli random.ml

	ocamlopt -a general.cmx fatal.cmx int.cmx float.cmx option.cmx stack.cmx list.cmx map.cmx queue.cmx set.cmx tree.cmx string.cmx char.cmx bool.cmx terminal.cmx file.cmx array.cmx random.cmx -o $(LIB_NAME).cmxa

clean:
	rm -f *.o *.a *.s *.cmi *.cmx *.cmxa *.cmo *.cma
