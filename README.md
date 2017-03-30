# iOS Boilerplate

A boilerplate for Swift iOS applications

## Getting Started

```bash
$ git clone https://github.com/tomykho/ios-boilerplate.git <your-project-name>
$ cd <your-project-name>
$ git remote rename origin github
$ git remote set-url --push github disabled
$ git remote add origin <your-repository-url>

```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To install dependencies:

```bash
$ carthage bootstrap --platform iOS --no-use-binaries
```

### Rename the project

1. Click on the project you want to rename in the "Project navigator" on the left of the Xcode view.
2. On the right select the "File inspector" and the name of your project should be in there under "Identity and Type", change it to the new name.
3. Click "Rename" in a dropdown menu
