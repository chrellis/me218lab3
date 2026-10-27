# ==============================================================================
# PIC32MX170F256B Standalone Makefile
# Microchip XC32 v6.00 Toolchain on macOS
# ==============================================================================

# Target MCU and Project Name
DEVICE       ?= 32MX170F256B
TARGET       ?= Lab2Projecto

# Toolchain Directory and Binaries
XC32_DIR     ?= /Applications/microchip/xc32/v6.00
BIN_DIR      ?= $(XC32_DIR)/bin
CC            = $(BIN_DIR)/xc32-gcc
BIN2HEX       = $(BIN_DIR)/xc32-bin2hex
SIZE          = $(BIN_DIR)/xc32-size

# Microchip Device Family Pack (DFP) Path
DFP_DIR      ?= $(HOME)/.mchp_packs/Microchip/PIC32MX_DFP/1.7.380

# Source Files and Output Directory
SRCS          = SimMain.c
BUILD_DIR     = build

# Object Files
OBJS          = $(addprefix $(BUILD_DIR)/, $(SRCS:.c=.o))

# Compilation Flags
CFLAGS        = -mprocessor=$(DEVICE) \
                -mdfp=$(DFP_DIR) \
                -I. \
                -I$(DFP_DIR)/include \
                -O1 \
                -g \
                -ffunction-sections \
                -fdata-sections

# Linker Flags
LDFLAGS       = -mprocessor=$(DEVICE) \
                -mdfp=$(DFP_DIR) \
                -Wl,--defsym=__MPLAB_BUILD=1 \
                -Wl,--gc-sections \
                -Wl,-Map=$(BUILD_DIR)/$(TARGET).map

# Default Target
.PHONY: all hex clean size

all: hex

# Ensure build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile C sources into object files
$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Link objects into ELF binary
$(BUILD_DIR)/$(TARGET).elf: $(OBJS) | $(BUILD_DIR)
	@echo "Linking $@..."
	$(CC) $(OBJS) $(LDFLAGS) -o $@

# Convert ELF to Intel HEX file
$(BUILD_DIR)/$(TARGET).hex: $(BUILD_DIR)/$(TARGET).elf
	@echo "Generating HEX $@..."
	$(BIN2HEX) $<
	@echo "Build successful! Target: $@"
	@$(SIZE) $<

hex: $(BUILD_DIR)/$(TARGET).hex

size: $(BUILD_DIR)/$(TARGET).elf
	@$(SIZE) $<

clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)
