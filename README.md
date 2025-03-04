# Example of Failing Compilation depending on protoc import Order

the package spiral/roadrunner-bridge v3.6.2 changed the import order and broke the proto compilation for our Services, this repository is a minimal testcase.
to show the problem.

## stand alone Testcase

the script `./protoc_example.sh`

tries to compile the source code 2 times. first with the import order of **v3.6.1** second with the order of **v3.6.2**

## Itegration in an spiral framework Project for Reroduction

1. setup an Spiral Framework App using the spiral/roadrunner-bridge:v3.6.1
2. checkout the this repository in the project as `./example-proto`
3. get the protoc compiler with `vendor/bin/rr download-protoc-binary -n`
2. configure app/config/grpc.php with the following values

```php
'services' => [
        directory('root') . '/example-proto/Company/One/service_one.proto',
    ],
    'servicesBasePath' => directory('root') . '/example-proto/',
```

4. run `php app.php grpc:generate` and the compilation succeeds!!
5. update to version 3.6.2 with `composer req spiral/roadrunner-bridge:v3.6.2`
6. run `php app.php grpc:generate` and the compilation fails 




