# How to use gomock

[gomock] is a mocking library for GoLang. It works by generating the mocks for the interfaces you have defined in your 
source code. The Go Harness comes with this library pre-installed and enabled. However, you would need to define the 
source files for which you want to generate the mocks.

## Defining mocks

You can define the source paths for the mock generation in `workspace.yml`. By default, the harness comes with an example 
test under `test` directory, and the mock path is defined for it too. Feel free to remove it and override the `app.mockgen`
attribute as per your requirement.
The `app.mockgen` attribute can contain following possible values:
```yaml
attributes:
  app:
    mockgen:
        mode: source
        paths:
          - source: "./test/example.go"
            package: "test"
            destination: "./test/example_mocks.go"
        mode: reflect
        paths:
          - import: "ci-go-sample/test"
            symbols: "Example"
            package: "test"
            destination: "./test/example_mocks.go"
```
- `mode` defines the mockgen operation mode. There are two modes possible, `source` and `reflect`. For more information, 
check [mockgen modes]. You can only use one of them.
- Depending on the mode you have selected, you would need to provide the paths:
  - `source` mode: in this mode, the only required attribute is `paths.source`, which contains the relative path of the 
  source file which contains the interface(s) for which you want to generate the mock(s).  
  - `reflect` mode: in this mode, you need to provide `paths.import` and `paths.symbols`. The `paths.import` contains the path
  of the package from which you want to generate the mock(s), and `paths.symbols` contains a comma-separated list of 
  interface names from that package for which the mocks would be generated.
- The `paths.package` and `paths.destination` attributes are optional in both modes. If you don't pass them, they will be auto-inferred.

## Commands

### `ws install --step prepare`

After modifying the `app.mockgen` attribute, you need to run this command. It will regenerate the `tools/scripts/mockgen.sh` script.

### `ws go generate`

Runs `go generate` command, which will internally execute `tools/scripts/mockgen.sh` script to regenerate mocks.

## Conditional generation

The `source` mode supports a way to conditionally regenerate the mock types only if the relevant source code has changed.
It compares the modification time of mock file with its relevant source file to detect.

[gomock]: https://github.com/golang/mock
[mockgen modes]: https://github.com/golang/mock#running-mockgen
