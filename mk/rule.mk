$(BIN)/$(BINFILE): $(C) $(H)
	cmake         --preset musl
	cmake --build --preset musl -j
