# smart-home-distro
Customized operating system, tailored towards smart home systems based on Debian Linux


### Reassembling the File
To reassemble the split files into the original tar.gz file, use the following command:

```bash
cat part_* > smart-distro-arm64.tar.gz

# OS Modification Helper Script

## Overview

The `os_mod_helper.sh` is a Bash script designed to assist in building, extracting, and modifying the Smart Home Distro distribution tarball. This script provides a straightforward way to manage the distribution file and make necessary OS configuration changes.

## Features

- **Reassemble Tarball:** Combine split tarball parts into a single file
- **Extract Tarball:** Easily extract the distribution files
- **Rebuild Tarball:** Recreate the tarball after making modifications
- **Modification Instructions:** Provide guidance on how to modify the distribution


## Usage

### Script Options

```bash
./os_mod_helper.sh [OPTION]
```

Available options:

- `--reassemble`: Reassemble the tarball from split parts
- `--extract`: Extract the tarball for modifications
- `--rebuild`: Rebuild the tarball after modifications
- `--instructions`: Show modification instructions

### Example Workflows

#### 1. Reassemble Tarball
```bash
./os_mod_helper.sh --reassemble
```

#### 2. Extract Tarball for Modifications
```bash
./os_mod_helper.sh --extract
```

#### 3. Rebuild Tarball After Modifications
```bash
./os_mod_helper.sh --rebuild
```

## Modification Process

1. Use `--extract` to unpack the tarball
2. Navigate to the extracted directory
3. Make necessary modifications
4. Use `--rebuild` to create an updated tarball

## Permissions

Ensure the script is executable:
```bash
chmod +x os_mod_helper.sh
```

## Error Handling

The script uses `set -e`, which means it will exit immediately if any command fails. This helps prevent partial or incomplete operations.

## Caution

- Always backup your original tarball before making modifications
- Verify modifications before rebuilding the distribution

## License

[Include your project's license information here]

## Contributing

Contributions and improvements to the script are welcome. Please submit pull requests or issues to the project repository.
