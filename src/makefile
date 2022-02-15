CUSTOM_LIBRARY_LOCATION = lib
COMPILE = ocamlopt -O3 -nopervasives -I $(CUSTOM_LIBRARY_LOCATION) -c

build:
	$(COMPILE) types.ml
	$(COMPILE) odds.ml
	$(COMPILE) expectedQuantities.ml
	$(COMPILE) main.ml

	ocamlopt -I $(CUSTOM_LIBRARY_LOCATION) $(CUSTOM_LIBRARY_LOCATION)/library.cmxa types.cmx odds.cmx expectedQuantities.cmx main.cmx -o program

mostlyclean:
	rm -f *.o *.a *.s *.cmi *.cmx *.cmxa *.cmo *.cma

clean:
	rm -f *.o *.a *.s *.cmi *.cmx *.cmxa *.cmo *.cma program

make install:
	make build
	make mostlyclean

run:
	./program