# DNS lookup tests

The idea behind this tool is to provide a portable and low-dependancy way to test DNS resolution from different points in a given network. This can be particularly useful, to test the resolution of multiple domains and sub-domains, for example, in a setup which involves multiple DNS servers, resolvers, or complex network setups, where the rules and requirements for DNS resolution could be arbitrary, and domain based.

**Note: The examples given in here are for reference only, and refer to publicly resolvable addresses and DNS servers, but these can be modified based on the required use case**

## General idea

Use bats as a testing framework
Use nslookup to verify the lookup of a given address
Use timeout to specify a maximum time (in case of firewall rules blocking traffic)
Use docker as a base dependancy, if required
Uses jinja2 + rendered yaml for easy definition of testing criteria

## Build

```console
docker build -t bats-dns:local .
```

## Run tests

```console
docker run --rm \
-v $(pwd):/code \
bats-dns:local
```

```console

❯ docker run --rm -v $(pwd):/code bats-dns:local
1..12
ok 1 Testing A record resolution of google.com towards 1.1.1.1
ok 2 Testing A record resolution of amazon.com towards 1.1.1.1
ok 3 Testing AAAA record resolution of google.com towards 1.1.1.1
ok 4 Testing AAAA record resolution of amazon.com towards 1.1.1.1
ok 5 Testing MX record resolution of mail.google.com towards 1.1.1.1
ok 6 Testing MX record resolution of mail.yahoo.com towards 1.1.1.1
ok 7 Testing A record resolution of google.com towards 8.8.8.8
ok 8 Testing A record resolution of amazon.com towards 8.8.8.8
ok 9 Testing AAAA record resolution of google.com towards 8.8.8.8
ok 10 Testing AAAA record resolution of amazon.com towards 8.8.8.8
ok 11 Testing MX record resolution of mail.google.com towards 8.8.8.8
ok 12 Testing MX record resolution of mail.yahoo.com towards 8.8.8.8
removed 'dns-lookup-tests.bats'

```

## TODO and ideas

- Add debug capability
- Consider different approaches to passing config
