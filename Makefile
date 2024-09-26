PROTO_SRC=proto
PROTO_GEN_GO=gen/go/
PROTO_FILES=$(PROTO_SRC)/calculator/*.proto
GO_GRPC_OUT=./$(PROTO_GEN_GO)


.PHONY: generate-go
generate-go:
	mkdir $(PROTO_GEN_GO)
	protoc -I=$(PROTO_SRC) $(PROTO_FILES) --go_out=$(GO_GRPC_OUT) --go_opt=paths=source_relative --go-grpc_out=$(GO_GRPC_OUT) --go-grpc_opt=paths=source_relative


.PHONY: clean
clean:
	rm -rf $(PROTO_GEN_GO)


.PHONY: help
help:
	@echo "Available make targets:"
	@echo "  generate-go: - Generate Go code from proto files"
	@echo "  clean        - Remove generated files"
	@echo "  help         - Display this help message"