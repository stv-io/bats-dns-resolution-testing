# DNS lookup tests

The idea behind this tool is to provide a portable and low-dependancy way to test DNS resolution from different points in a given network. This can be particularly useful, to test the resolution of multiple domains and sub-domains, for example, in a setup which involves multiple DNS servers, resolvers, or complex network setups, where the rules and requirements for DNS resolution could be arbitrary, and domain based.

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
