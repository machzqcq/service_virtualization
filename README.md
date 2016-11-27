# Service Virtualization
Why - [here](https://seleniumframework.wordpress.com/2015/12/31/open-source-service-virtualization/) and [here](https://www.thoughtworks.com/radar/tools/mountebank)
[Stubs](http://www.mbtest.org/docs/api/stubs) are test doubles (aka. mock services), 
imposter is an abstract for virtualized service, stubs include predicates and responses.
[predicates](http://www.mbtest.org/docs/api/predicates) specify
how an incoming request should match the stub (in the absence of predicate, stub always matches and hence no reason to have more than one stub),
[responses](http://www.mbtest.org/docs/api/stubs) - proxies, injection and behaviors.  

## Features  
- [Examples and References](http://www.mbtest.org/docs/examples)  
- Supported Protocols - http, https, tcp and smtp
- [Mocks](http://www.mbtest.org/docs/api/mocks) - remember information about each request to each imposter
- [Contact and Resource Model](http://www.mbtest.org/docs/api/contracts)


# How

- git pull 
- Install [docker](https://docs.docker.com/engine/installation/)
- `docker build -t mymountebank -f mountebank.dockerfile .`
- `docker run --name mymountebank-1 -d -p 2525:2525 -p 4545-4555:4545-4555 mymountebank:latest` - starts mb with defaults
- starts mb by injecting the imposter templates. The templates themselves are javascript files, so lots of logic can be injected
```
docker run -v $(pwd)/templates/sample:/templates -p 4546:4546 -p 5555:5555 -p 2525:2525 -d mymountebank:latest 
--configfile templates/imposters.ejs --allowInjection
```
- From here you can start defining imposters as per the [documentation](http://www.mbtest.org/docs/api/stubs)

# More options
- mb server has many [command-line](http://www.mbtest.org/docs/commandLine) config options. Options are appended to e.g. `docker run....--mock`

