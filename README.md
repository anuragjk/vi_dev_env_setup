### myWorkEnv.sh
---
This script is used to install and configure some required tools for setting up a vi/vim based development environment

user can run the script from enywhere, but should use sudo as the script tries to install some packages
script will enable the capabilities for current user only, script usage is as shown below
```
$ sudo ./myWorkEnv.sh 
```
| Functionalities ||
| --- | --- |
| `ctrl + n` | toggles a file tree view in vi/vim |

### setupTags.sh
---

Automates creating required files for both cscope and ctags
Right now script is written to fetch files with extensions *.c/*.h/*.cpp/*.hpp

user is expected to copy the script to root directory of the project and run the script as shown below
```
$ ./setupTags.sh -d <dir 1> -d <dir 2>
```
`<dir 1>` and `<dir 2>` are path to relevent directories in the project.
if all directories are relevent you can simply use
```
$ ./setupTags.sh -d .
```

### Planned feature
---
- [ ] Use from any directory
- [ ] supertab

### Test details
---

| Tested	on | Tested by | Date | status |
| --- | --- | --- | --- |
| Ubuntu 16.04 | Anurag | 30/8/2022 | OK |
| Ubuntu 18.04 | Anurag | 31/8/2022	| OK |

