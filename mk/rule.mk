$(BIN)/$(BINFILE): $(C) $(H)
	cmake         --preset linux
	cmake --build --preset linux -j

