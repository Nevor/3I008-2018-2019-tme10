OJS_DIR=../
JS_OF_OCAML_DIR=/home/rgabriel/shared_binaries/js_of_ocaml/v3.3.0/4.07/win/

CAMLC=ocamlc
COMPFLAGS=-I $(OJS_DIR)

GEN_JS_API=../gen_js_api.exe
OJSFLAGS=ojs.cma

JS_OF_OCAML=$(JS_OF_OCAML_DIR)/js_of_ocaml.exe
JS_OF_OCAML_FLAGS=--no-runtime $(shell cygpath -wl $(JS_OF_OCAML_DIR))/runtime.js $(OJS_DIR)/ojs_runtime.js

ENGINE_OBJS=calc.cmo
JS_DEPS=dom.cmi
JS_OBJS=$(ENGINE_OBJS) dom.cmo view.cmo



.SUFFIXES: .ml .mli .cmo .cmi .cmx

.ml.cmo:
	$(CAMLC) $(COMPFLAGS) -c $<

.mli.cmi:
	$(CAMLC) $(COMPFLAGS) -c $<

calc-cli: $(ENGINE_OBJS)
	$(CAMLC) -o $@ $^

dom.ml: dom.mli
	$(GEN_JS_API) dom.mli

ocaml-calc.byte: $(JS_DEPS) $(JS_OBJS)
	$(CAMLC) $(COMPFLAGS) -no-check-prims -o $@ $(OJSFLAGS) $(JS_OBJS)

ocaml-calc.js: ocaml-calc.byte
	$(JS_OF_OCAML) $(JS_OF_OCAML_FLAGS) $^

clean:
	rm -rf *.cmo *.cmi *.cmx *.cma *.o *.byte
	rm -f calc-cli dom.ml ocaml-calc.js
