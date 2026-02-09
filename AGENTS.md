# AGENTS.md - TWRP Device Tree for digitnext

This is a TWRP (Team Win Recovery Project) device tree for the Digit device (MediaTek MT6762 platform).

## Build Commands

### Full TWRP Build
```bash
# Set up build environment (from AOSP root)
source build/envsetup.sh

# Build for digitnext device
lunch twrp_digitnext-eng
m -j$(nproc)

# Build just this device tree
m -j$(nproc) dist
```

### Building Individual Modules
```bash
# Build bootctrl HAL
m -j$(nproc) android.hardware.boot@1.2-impl
m -j$(nproc) bootctrl.mt6762

# Build mtk_plpath_utils
m -j$(nproc) mtk_plpath_utils
m -j$(nproc) mtk_plpath_utils.recovery
```

### Building Recovery Only
```bash
# Build recovery image
m -j$(nproc) recoveryimage

# Or with dist
m -j$(nproc) recoveryimage dist
```

### Flash and Test
```bash
# Flash boot image (fastboot)
fastboot flash boot boot.img

# Flash all partitions (if using fastbootd)
fastbootd
fastboot flash system system.img
fastboot flash vendor vendor.img

# Boot recovery
fastboot boot boot.img
```

## Code Style Guidelines

### C/C++ Style
- Follow Android's C++ style (https://source.android.com/docs/contribute/code-style)
- Use 4-space indentation, no tabs
- Max line length: 100 characters
- Use `nullptr` instead of `NULL`
- Use `android::base` utilities for file operations
- Use `ALOGI`, `ALOGE`, `LOG(ERROR)` for logging (define `LOG_TAG` at file top)
- Place opening braces on same line as control statements
- Use `std::make_unique<T>()` for unique_ptr creation

### Header Order
1. System headers (stdio, stdlib, etc.)
2. C++ standard library headers
3. Android base headers
4. Android hardware/HAL headers
5. Local headers

### Naming Conventions
- **Files**: snake_case.cpp, snake_case.h
- **Classes**: PascalCase
- **Functions**: camelCase
- **Variables**: camelCase (prefix `m` for member variables)
- **Constants**: UPPER_SNAKE_CASE
- **Macros**: UPPER_SNAKE_CASE (prefix project/namespace identifier)

### Android.mk Guidelines
- Use `$(call my-dir)` for LOCAL_PATH
- Use `$(LOCAL_PATH)` for device-specific paths
- Include conditional blocks with `ifeq ($(TARGET_DEVICE),digitnext)`
- Prefix custom variables with device name: `DIGITNEXT_`
- Use `ALLOW_MISSING_DEPENDENCIES := true` for vendor dependencies

### Android.bp Guidelines
- Use tabs for indentation in `bp` files
- Use `cflags` for C/C++ flags, `cppflags` for C++ only
- Use `enabled: true` for recovery variants

### Shell Scripts
- Use POSIX-compliant sh syntax (no bashisms)
- Use `#!/bin/sh` shebang
- Check return codes explicitly: `if [ $? -ne 0 ]; then ...`
- Quote variables: `"$VAR"` not `$VAR`

### Recovery Configuration Files (.rc, .fstab)
- Use Android property syntax: `setprop property value`
- Use correct partition paths: `/dev/block/by-name/...`
- Group related services together
- Add comments for device-specific customizations

### Licensing
- All source files must include Apache 2.0 license header
- Use `SPDX-License-Identifier: Apache-2.0`
- Keep original copyright notices for borrowed code

### Error Handling
- Check return values from system calls
- Use `goto cleanup` pattern for resource cleanup in C
- Log errors with `ALOGE` before returning
- Return early on failure to reduce nesting

### Git Workflow
- Commit messages: "component: description" format
- Make atomic commits (one feature per commit)
- Test changes before committing
- Never commit generated or build artifacts

## Project Structure
```
digitnext/
├── Android.mk              # Main entry point
├── AndroidProducts.mk      # Product configuration
├── BoardConfig.mk          # Board configuration
├── device.mk               # Device-specific packages
├── twrp_digitnext.mk       # Recovery product definition
├── system.prop             # System properties
├── bootctrl/               # Boot Control HAL implementation
├── mtk_plpath_utils/       # MTK preloader utilities
├── recovery/               # Recovery-specific files
│   ├── root/
│   │   ├── init.recovery.mt6762.rc
│   │   ├── system/etc/
│   │   │   ├── recovery.fstab
│   │   │   └── twrp.flags
│   │   └── vendor/
│   └── prebuilt/           # Prebuilt libraries
└── prebuilt/               # Prebuilt kernel and DTB
```
